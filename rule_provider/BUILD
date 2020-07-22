load("//:bazel/count_items.bzl", "count_items")
load("//:bazel/print_count.bzl", "print_count")

count_items(
    name="count",
    items=[1, 7, 13, 33],
)

print_count(
    name="print",
    rule_dep=":count",
)


