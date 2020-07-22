def _write_jdbc(ctx):
  out = ctx.actions.declare_file("{}.cfg".format(ctx.label.name))

  args = ctx.actions.args()
  args.add(out)

  ctx.actions.run_shell(
    command="""
      echo "JDBC is $MY_JDBC_URL"
      echo "$MY_JDBC_URL" > $1
    """,
    use_default_shell_env=True,  # <1>
    arguments=[args],
    outputs=[out])

  return [DefaultInfo(files=depset([out]))]

write_jdbc = rule(
  implementation = _write_jdbc,
)
