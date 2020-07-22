def _debug(ctx):
  print(dir(native))
  print(dir(ctx))
  print(dir(native.environment))

debug = rule(
  implementation = _debug,
)
