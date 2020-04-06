// Enhance the XML program to add spaces to show the indentation structure

Builder := Object clone
Builder tab_size := 4
Builder forward = method(
  ctx := call slotContext

  if (ctx slotNames contains("_indent") == false, ctx _indent := 0, ctx _indent = ctx _indent + ctx tab_size)
  indent := ctx _indent

  tabulation := " " repeated(indent)
  writeln(tabulation,  "<", call message name, ">")

  call message arguments foreach(arg,
    content := self doMessage(arg)
    if(content type == "Sequence", writeln(" " repeated(ctx _indent + ctx tab_size), content))
  )

  ctx _indent = ctx _indent - ctx tab_size
  writeln(" " repeated(indent), "</", call message name, ">")
)

Builder html(
  body(
    div (
      h2 ("An Unordered HTML List")
      ul( li("Coffee"), li("Tea"), li("Milk"))
      p ("An Ordered HTML List")
      ol (li("Coffee"), li("Tea"), li("Milk")
      )
    )
  )
)
