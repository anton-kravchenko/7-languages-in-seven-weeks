
TheBuilder html(
  body({"id": "root", "class":"main"},
    div ({"id":"div"},
      h2 ("An Unordered HTML List")
      ul( li("Coffee"), li("Tea"), li("Milk"))
      p ("An Ordered HTML List")
      ol (li("Coffee"), li("Tea"), li("Milk")
      )
    )
  )
)
