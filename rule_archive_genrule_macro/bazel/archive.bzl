# tag::all[]
def archive(name, files, out):
    native.genrule(  # <1>
        name=name,
        outs=[out],
        srcs=files,
        cmd="zip $(OUTS) $(SRCS)")
# end::all[]
