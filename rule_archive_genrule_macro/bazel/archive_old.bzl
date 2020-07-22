# tag::all[]
# tag::implementation[]
def _archive(ctx):
  out_file = ctx.actions.declare_file(ctx.attr.out)
  args = ctx.actions.args()

  args.add(out_file)
  args.add_all(ctx.files.files)

  # tag::execute[]
  ctx.actions.run(
    executable="zip",
    arguments=[args],
    inputs=ctx.files.files,
    outputs=[out_file])
  # end::execute[]

  # tag::return[]
  return [DefaultInfo(files=depset([out_file]))]
  # end::return[]
# end::implementation[]

# tag::declaration[]
archive = rule(
  implementation = _archive,
  attrs = {
    "files": attr.label_list(allow_files=True),
    "out": attr.string(mandatory=True),
  }
)
# end::declaration[]
# end::all[]
