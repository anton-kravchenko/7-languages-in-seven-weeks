arr = (1..10).to_a
arr2 = arr[1..3]
first_from_end = arr[-1]

nums = { 1 => "one", 2 => "two" }
puts nums.keys
puts nums.values

# Symbols
stuff = { :array => [1, 2, 3], :string => "str" }
stuff.each { |v| puts v }
:string.object_id # Symbols are unique but stored as a single copy (in runtime)

# Blocks (still can't figure out the difference with anonymous functions)
3.times { puts "hello there" }

def call_block(&block)
  block.call
end

def pass_block(&block)
  call_block(&block)
end

pass_block { puts "mess with block" }

# Custom n_times method

class Fixnum
  def n_times
    i = self
    while i > 0
      yield i
      i -= 1
    end
  end
end

# "Reduce" method
s = [1, 2, 3]
s.inject(10) { |sum, el| sum + el }
s.inject { |sum, el| sum + el }

# Array to hash
a = [1, 2, 3]
h = a.each_slice(2).to_a.to_h
h.keys
h.values

# * is a JS spread
[*h.keys, *h.values]

# zipping
h = { 1 => 2, 3 => 4 }
h.keys.zip(h.values).flatten # [1, 2, 3, 4]

f = {
  "grandpa" => {
    "dad" => {
      "child 1" => {},
      "child 2" => {},
    },
    "uncle" => {
      "child 3" => {},
      "child 4" => {},
    },
  },
}

puts f
