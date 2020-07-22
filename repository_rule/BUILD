# tag::all[]
genrule(
  name="indexes",
  srcs=[
    "@index-germanium//:data",
    "@index-google//:data",
  ],
  outs=[
      "out.zip",
  ],
  cmd="zip $(OUTS) $(SRCS)"
)
# end::all[]
