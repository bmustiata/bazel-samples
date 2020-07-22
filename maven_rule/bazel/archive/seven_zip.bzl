# tag::all[]
# tag::rule_implementation[]
def _seven_zip(ctx):
  out = ctx.actions.declare_file("{}.7z".format(ctx.label.name))  # <1>

  inputs = [ ctx.file.version_data ]  # <2>
  inputs.extend(ctx.files.archive_files) # <3>

  args = ctx.actions.args()
  args.add(out)  # <1>
  args.add(ctx.file.version_data)  # <2>
  args.add_all(ctx.files.archive_files) # <3>

  ctx.actions.run(
    executable=ctx.executable._seven_zip_binary,  # <4>
    arguments=[args],
    inputs=inputs,
    outputs=[out])

  return [DefaultInfo(files=depset([out]))]
# end::rule_implementation[]

# tag::rule_definition[]
seven_zip = rule(
  implementation = _seven_zip,
  attrs = {
    "_seven_zip_binary": attr.label(
        executable=True,  # <1>
        default=":_seven_zip_binary",  # <2>
        cfg="host",  # <3>
    ),
    "version_data": attr.label(  # <4>
        allow_single_file=True,
        mandatory=True,
    ),
    "archive_files": attr.label_list(  # <5>
        allow_files=True,
        mandatory=True,
        allow_empty=False
    ),
  }
)
# end::rule_definition[]
# end::all[]
