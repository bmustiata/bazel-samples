# tag::all[]
def _single_variable(ctx):
  # tag::out[]
  out = ctx.actions.declare_file("{}.value".format(ctx.label.name))  # <1>
  # end::out[]

  # tag::if[]
  if ctx.label.name.startswith("STABLE_"):  # <2>
    input_file = ctx.info_file
  else:
    input_file = ctx.version_file
  # end::if[]

  # tag::action[]
  args = ctx.actions.args()
  args.add(ctx.label.name)
  args.add(input_file)
  args.add(out)

  ctx.actions.run_shell(
    command="""
      grep "^$1 " $2 | sed -e "s/^$1 //" > $3
    """,
    arguments=[args],
    inputs=[input_file],  # <3>
    outputs=[out])
  # end::action[]

  return [DefaultInfo(files=depset([out]))]

single_variable = rule(
  implementation = _single_variable,
)
# end::all[]
