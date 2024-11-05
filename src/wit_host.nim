import std/[strformat, os, macros, strutils, json, genasts]
import wit, wit_gen

when not declared(buildOS):
  const buildOS {.magic: "BuildOS".}: string = hostOS
const windowsHost = buildOS == "windows"
const cmdPrefix = when windowsHost: "cmd /E:ON /C " else: ""

func hostQuoteShell(s: string): string =
  ## Quote ``s``, so it can be safely passed to shell.
  when not defined(windows) and windowsHost:
    result = quoteShellWindows(s)
  else:
    result = quoteShell(s)

macro witBindGenImpl(witPath: static[string], dir: static[string], body: untyped): untyped =
  let path = if witPath.isAbsolute:
    witPath
  else:
    dir / witPath

  let cmd = &"wasm-tools component wit {path.hostQuoteShell} --json"
  hint "Running: " & cmdPrefix & cmd
  let res = gorgeEx(cmdPrefix & cmd)
  if res.exitCode != 0:
    error("Failed to read wit files:\n" & res.output)

  let json = try:
    res.output.parseJson()
  except Exception as e:
    error("Failed to decode json from wit: " & e.msg & "\n" & res.output)

  var ctx = newWitContext(json)
  ctx.useCustomBuiltinTypes = false

  var typeSection = ctx.genTypeSection()

  let code = genAst(typeSection):
    {.push hint[DuplicateModuleImport]:off.}
    import std/[options]
    from std/unicode import Rune
    import results, wit_types
    {.pop.}

    typeSection

  hint "Write api to " & (dir / "host.nim")
  writeFile(dir / "host.nim", code.repr)
  return code

template witBindGen*(witPath: static[string], body: untyped): untyped =
  witBindGenImpl(witPath, instantiationInfo(-1, true).filename.replace("\\", "/").splitPath.head, body)
