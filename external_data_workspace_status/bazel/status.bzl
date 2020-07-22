# tag::all[]
def _status(ctx):
  # WRONG! DON'T IMPLEMENT LIKE THIS.
  out = ctx.actions.declare_file(ctx.label.name)

  args = ctx.actions.args()
  args.add(ctx.info_file)     # <1>
  args.add(ctx.version_file)  # <2>
  args.add(out)               # <3>

  ctx.actions.run_shell(
    command=""" # <4>
      echo "Project Status $(cat $1 | grep GIT | cut -f2 -d\ ) built at $(cat $2 | grep CURRENT_TIME | cut -f2 -d\ )." > $3
    """,
    arguments=[args],
    inputs=[ctx.version_file, ctx.info_file],  # <5>
    outputs=[out])

  return [DefaultInfo(files=depset([out]))]

# tag::declaration[]
status = rule(
  implementation = _status,
)
# end::declaration[]
# end::all[]
