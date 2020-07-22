# tag::all[]
# tag::implementation[]
def _archive(ctx):  # <1>
  out_file = ctx.actions.declare_file(ctx.attr.out)
  args = ctx.actions.args()

  args.add(out_file)
  args.add_all(ctx.files.files)  # <5>

  # tag::execute[]
  ctx.actions.run(
    executable="zip",
    arguments=[args],
    inputs=ctx.files.files,
    outputs=[out_file])
  # end::execute[]

  # tag::return[]
  return [DefaultInfo(files=depset([out_file]))]  # <6>
  # end::return[]
# end::implementation[]

# tag::declaration[]
archive = rule(  # <2>
  implementation = _archive,
  attrs = {  # <3>
    "files": attr.label_list(allow_files=True),  # <4>
    "out": attr.string(mandatory=True),
  }
)
# end::declaration[]
# end::all[]
