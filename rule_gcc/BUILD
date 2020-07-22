load(":bazel/compile.bzl", "compile")
load(":bazel/link.bzl", "link")
load(":bazel/archive.bzl", "archive")

compile(
  name="compile",
  srcs=[
    "src/main.c",
    "src/print.c",
  ],
  hdrs=[
    "src/print.h",
  ]
)

link(
  name="link",
  objs=[":compile"],
  out="main",
)

archive(
  name="out.zip",
  files=["src/README.md", ":link"],
)

