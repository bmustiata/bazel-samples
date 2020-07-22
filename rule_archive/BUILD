# tag::all[]
# tag::load[]
load(":bazel/archive.bzl", "archive")
# end::load[]

# tag::targets[]
archive(
  name="documentation",  # <1>
  files=[
    "src/README.md",
  ],
  out="documentation.zip",
)

archive(
  name="release",  # <2>
  files=[
    "src/RELEASE.md",
  ],
  out="release.zip",
)

archive(
  name="all",  # <3>
  files=[
    "src/README.md",
    "src/RELEASE.md",
  ],
  out="all.zip",
)
# end::targets[]
# end::all[]

