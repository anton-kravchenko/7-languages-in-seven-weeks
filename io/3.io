slow := Object clone
slow start := method(wait(3); writeln("slow"))

fast := Object clone
fast start := method(wait(1); writeln("fast"))

// slow start; fast start; // execute one by one in a single thread
// slow @@start; fast @@start; wait(4); // exec 2 functions in separate actors

// future
futureResult := URL with("http://google.com/") @fetchwriteln("Making GET request")
writeln("Response size: ", future size)
