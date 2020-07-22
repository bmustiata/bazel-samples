# tag::all[]
load(":bazel/compile.bzl", "compile")
load(":bazel/link.bzl", "link")
load(":bazel/archive.bzl", "archive")

def application(name, srcs, hdrs, extra_files):  # <1>
    compile(  # <2>
      name="compile",
      srcs=srcs,
      hdrs=hdrs,
    )

    link(  # <2>
      name="link",
      objs=[":compile"],
      out="main",
    )

    archive_files = [":link"]
    archive_files.extend(extra_files)

    archive(  # <2>
      name=name,  # <3>
      files=archive_files,
    )
# end::all[]

