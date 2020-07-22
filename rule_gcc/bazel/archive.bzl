# tag::all[]
# tag::implementation[]
def _archive(ctx):  # <1>
  out = ctx.actions.declare_file(ctx.label.name)
  args = ctx.actions.args()

  args.add(out)
  args.add_all(ctx.files.files)  # <5>

  # tag::execute[]
  ctx.actions.run(
    executable="zip",
    arguments=[args],
    inputs=ctx.files.files,
    outputs=[out])
  # end::execute[]

  return [DefaultInfo(files=depset([out]))]
# end::implementation[]

# tag::declaration[]
archive = rule(  # <2>
  implementation = _archive,
  attrs = {  # <3>
    "files": attr.label_list(allow_files=True),  # <4>
  }
)
# end::declaration[]
# end::all[]
