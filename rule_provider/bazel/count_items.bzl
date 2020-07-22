load("//:bazel/counter.bzl", "Counter")  # <1>

def _count_items(ctx):
    item_count = len(ctx.attr.items)    # <2>
    return [Counter(count=item_count)]  # <3>

count_items = rule(
  implementation = _count_items,
  attrs = {
    "items": attr.int_list(),
  }
)
