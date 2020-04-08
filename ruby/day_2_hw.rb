require_relative "2_module_file"

# slice by 4
arr = (1..16).map { |i| i }
arr = (1..16).map { rand(10) }

arr.each_slice(4).to_a.each { |chunk| puts chunk.join(",") }
arr.each_index { |i| puts arr.slice(i - 4, 4).join(",") if 0 == i % 4 && i != 0 }
arr.each_index { |i| puts arr[i - 4..i].join(",") if 0 == i % 4 && i != 0 }

# generate tree
raw_tree = {
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

def create_tree(raw_tree, root = true, level = 0)
  if root
    node_name = raw_tree.keys[0]
    children = raw_tree[node_name]
    SerializableTree.new(node_name, create_tree(children, false, level + 1))
  else
    raw_tree.keys.map do |n|
      children = raw_tree[n]
      SerializableTree.new(n, children.keys ? create_tree(children, false, level + 1) : [], level)
    end
  end
end

tree = create_tree raw_tree
# puts tree
# tree.to_f

def grep(f_name, pattern)
  puts "Reading #{f_name}, searcing for /#{pattern.source}/"

  line_number = 1
  occurences = 0

  File.open(f_name) do |file|
    while line = file.gets
      if pattern.match line
        puts "Find occurence ##{occurences += 1}, line ##{line_number} - #{line.strip}"
      end

      line_number += 1
    end
  end
end

# grep("object#70164780481920.txt", /node /i)
