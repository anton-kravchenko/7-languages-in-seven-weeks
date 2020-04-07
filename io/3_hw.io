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

// Create a list syntax that uses brackets


squareBrackets := method(call message arguments)
[1, 2, 3] println

OperatorTable addAssignOperator(":", "atAssignAttr")

TheBuilder := Object clone do (
  tab_size := 4

  atAssignAttr := method(
    key := call evalArgAt(0) asMutable removePrefix("\"") removeSuffix("\"")
    val := list("\"", call evalArgAt(1), "\"") join
    " #{key}=#{val}" interpolate
  )

  curlyBrackets := method(
    call message arguments map(arg, self doMessage(arg)) join("")
  )

  forward = method(
    ctx := call slotContext

    args := call message arguments
    attrs := ""

    if (args size > 0 and args at (0) name == "curlyBrackets", attrs = doMessage(args removeFirst))

    if (ctx slotNames contains("_indent") == false, ctx _indent := 0, ctx _indent = ctx _indent + ctx tab_size)
    indent := ctx _indent

    tabulation := " " repeated(indent)
    writeln(tabulation,  "<", call message name, attrs, ">")

    args foreach(arg,
      content := self doMessage(arg)
      if(content type == "Sequence", writeln(" " repeated(ctx _indent + ctx tab_size), content))
    )

    ctx _indent = ctx _indent - ctx tab_size
    writeln(" " repeated(indent), "</", call message name, ">")
  )
)

doFile("the_builder_test.io")
