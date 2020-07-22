load("//:bazel/counter.bzl", "Counter")

def _print_count(ctx):
  rule_dep = ctx.attr.rule_dep
  print(rule_dep[Counter])

  # we can also access the items from the struct directly:
  print("Count is {}".format(rule_dep[Counter].count))

  return []

print_count = rule(
  implementation = _print_count,
  attrs = {
    "rule_dep": attr.label()
  }
)

