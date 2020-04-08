# In ruby it is possible to extend / overrite any class and certain behavior of a class
# This concept is called Open Classes
class NilClass
  def blank?
    true
  end
end

class String
  def blank?
    self.length == 0
  end
end

puts nil.blank?
puts "".blank?

["", "non empty", nil].each do |el|
  puts el unless el.blank?
end

# method_missing is a way to catch type errors in ruby
class WithMethodMissing
  def self.method_missing(name, *args)
    puts "WithMethodMissing doesn't have #{name} method, args - #{args}"
  end
end

puts WithMethodMissing.no_such_method "useless args"
