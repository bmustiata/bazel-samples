# tag::all[]
java_binary(  # <1>
  name = "_seven_zip_binary",
  # tag::glob[]
  srcs = glob([
    "src/main/java/**/*.java"
  ]),
  # end::glob[]
  main_class = "com.germaniumhq.ArchiveRule",  # <2>
  deps = [
    "@maven//:org_apache_commons_commons_compress",  # <3>
    "@maven//:commons_io_commons_io",
    "@maven//:org_tukaani_xz",
  ]
)

package(default_visibility = ["//visibility:public"])  # <4>
# end::all[]
