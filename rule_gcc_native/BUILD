load(":bazel/archive.bzl", "archive")

cc_binary(  # <1>
    name="main",
    srcs=[
        "src/main.c",
        "src/print.c",
        "src/print.h",
    ],
)

archive(
  name="out.zip",
  files=["src/README.md", ":main"],
)

