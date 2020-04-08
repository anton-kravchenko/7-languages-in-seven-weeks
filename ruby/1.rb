properties = ["object oriented", "duck typed", "productive", "fun"]

unless false
  properties.each { |propertie|
    puts "Ruby is #{propertie}" unless propertie == "fun"
  } if true
end

x = 0
x = x + 1 while x < 10
x = x - 1 until x > 0

puts "even 0 is treated as true" if 0

puts "everything is true except nil and false" unless nil and false

puts '&& is an equivalent of "and"' if true && true
puts '|| is an equivalent of "or"' if true || false

puts "& and | force execution of both sides of an expression" if true | (puts "right side of the expression")
puts "while && and || may skip evaluation of right side" if true || (puts "this will never be executed")

false && throw("never will be thrown")

puts "Here is how duck typing works"

a = ["1", 3, "3.0", "4"]
i = 0
while i < a.length
  puts a[i].to_i
  i += 1
end

# try / catch / no ex / finally
begin
  # ...
rescue
  # ...
else
  # ...
ensure
  # this always runs
end
