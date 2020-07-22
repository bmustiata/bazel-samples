# tag::all[]
# tag::implementation[]
def _status(ctx):
  out = ctx.actions.declare_file(ctx.label.name)

  args = ctx.actions.args()
  args.add(ctx.file._git_commit)
  args.add(ctx.file._current_time)
  args.add(out)

  ctx.actions.run_shell(
    command="""
      echo "Project Status $(cat $1) built at $(cat $2)." > $3
    """,
    arguments=[args],
    inputs=[ctx.file._git_commit, ctx.file._current_time],
    outputs=[out])

  return [DefaultInfo(files=depset([out]))]
# end::implementation[]

# tag::declaration[]
status = rule(
  implementation = _status,
  attrs = {
    "_git_commit": attr.label(allow_single_file=True, default="//vars:STABLE_GIT_COMMIT"),
    "_current_time": attr.label(allow_single_file=True, default="//vars:CURRENT_TIME"),
  }
)
# end::declaration[]
# end::all[]
