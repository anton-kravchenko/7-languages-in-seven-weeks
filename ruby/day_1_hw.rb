attempt = 0
num = rand(100)
puts "Try to guess the number"

while true
  guess = gets().to_i
  attempt += 1

  break if guess == num

  puts "Attempt ##{attempt} - too #{guess < num ? "small" : "big"}"
end

puts "It took #{attempt} attempts to guess the number #{num}"
