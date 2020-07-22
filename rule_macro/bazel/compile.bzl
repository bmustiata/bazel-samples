# tag::all[]
# tag::implementation[]
def _compile(ctx):
  output = []

  # tag::forloop1[]
  for f in ctx.files.srcs:
    out = ctx.actions.declare_file(
        "{}.o".format(f.path[:-2]))
  # end::forloop1[]
    # tag::printout[]
    print("compiling {} -> {}".format(f, out))
    # end::printout[]

    inputs = [f]
    inputs.extend(ctx.files.hdrs)

    args = ctx.actions.args()
    args.add(f)
    args.add("-o")
    args.add(out)

    # tag::cppflags[]
    args.add("-c")
    args.add("-I/usr/lib/gcc/x86_64-linux-gnu/7/include")
    # end::cppflags[]

    output.append(out)

    # tag::forloop2[]
    # tag::execute[]
    ctx.actions.run(executable="gcc",
                    arguments=[args],
                    inputs=inputs,
                    outputs=[out])
    # end::execute[]
    # end::forloop2[]

  return [DefaultInfo(files=depset(output))]
# end::implementation[]

# tag::declaration[]
compile = rule( # <2>
  implementation = _compile,  # <3>
  attrs = { # <3>
    "srcs": attr.label_list(  # <4>
      allow_files=True,
      mandatory=True,
      allow_empty=False,
    ),
    "hdrs": attr.label_list(allow_files=True),
    "flags": attr.string(),
  }
)
# end::declaration[]
# end::all[]
