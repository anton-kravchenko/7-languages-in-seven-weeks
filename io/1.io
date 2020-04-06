// string here is a "receiver" while print is a "message"
"hi ho, io" print

// sends "clone" message to "Object"
// Vehicle is a type based on Object prototype
Vehicle := Object clone

// Assign the value to a new slot called "description"
// Object has slots, collection of slots is similar to "hash"
// := creates new slot if it is not exist (= in that case would throw)
Vehicle description := "the value for `description` field"

// sends command to object to retrieve the value
Vehicle description

// gets all slots from an object
Vehicle slotNames

// Clone the Vehicle
Car := Vehicle clone

ferrari := Car clone
ferrari slotNames // returns an empty list but
ferrari description // returns the value from Vehicle (prototype lookup)
ferrari slotNames // returns an empty list (because ferrari is not a type because it's not begin with upper-case letter)
ferrari type // returns Car (the prototype) - only types has "type" slot

// defines a method - method is an object
method('this method prints that message' println)
method() type // returns Block

// Add a method to Car prototype
Car drive := method("Aaaa ron don don" println)

ferrari drive // drive method gets called from Car prototype
ferrari getSlot("drive") // returns contents of given slot
ferrari proto // returns the prototype

// master's namespace
Lobby

// Collections
toDos := list("learn 7 lang", "read domain driven design")
amountOfTodos := toDos size
toDos append("and learn nodejs")

// List methods
list(1,2,3,4) average
list(1,2,3,4) sum
list(1,2,3,4) at(0)
list(1,2,3,4) append(5)
list(1,2,3,4) pop
list(1,2,3,4) prepend(0)
list() isEmpty

// Map
hash := Map clone
hash atPut("one", 1)
hash at("one")
hash atPut("another one", 1)
hash keys
hash asList
hash asObject
hash size
hash asList at(0) at(0)

// boolean
(0 or 1) and true
false proto
nil clone // nil, true and false are all singletons

// creating singletones by owerriding "clone" method
Singleton := Object clone
Singleton clone := Singleton

instance := Singleton clone
second_instance := Singleton clone

instance == second_instance

/*
Assignment operator
  ::= Creates slot, creates setter, assigns value
  :=  Creates slot, assigns value
  =	  Assigns value to slot if it exists, otherwise raises exception
*/

