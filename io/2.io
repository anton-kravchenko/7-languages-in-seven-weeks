// loops
while( i <= 10, i println; i = i + 1); "end of the while loop" println

from := 1
to := 2
step :=1

for (i, from, to, step, i println); "end of the for loop" println

// if statement
// if (condition, true code, false code)
if (true, "true branch" print, "false branch" print)
if (true) then("true branch" print) else ("false branch" print)

// Operator table
OperatorTable
// alter precedence of an operator

// adding operator
OperatorTable addOperator("xor", 11)
true xor :=  method(bool, if (bool, false, true))
false xor := method(bool, if (bool, true, false))

// Messages
// message has three arguments: sender, target and arguments
postOffice := Object clone

postOffice packageSender := method(call sender)
postOffice messageTarget := method(call target)
postOffice messageName   := method(call message name)
postOffice messageArgs   := method(call message arguments)

mailer := Object clone
mailer deliver := method(postOffice packageSender)

unless := method(
    (call sender doMessage(call message argAt(0)))
    ifFalse (call sender doMessage(call message argAt(1)))
    ifTrue (call sender doMessage(call message argAt(2)))
)

unless (1 == 2, "one is not two" println, "one is two" println)

