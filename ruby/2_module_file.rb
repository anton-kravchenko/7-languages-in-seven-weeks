require_relative "2_tree"

module ToFile
  def filename
    "object##{self.object_id}.txt"
  end

  def to_f
    File.open(filename, "w") { |f| f.write(to_s) }
  end
end

class SerializableTree < Tree
  include ToFile

  def to_s
    "#{" " * 3 * @level}Node name: #{@node_name}, Children: #{@children.length > 0 ?
      "\n" + @children.map { |c| c.to_s }.join("\n") : "[]"}"
  end
end

t = SerializableTree.new("root", [
  SerializableTree.new("Leaf A", [
    SerializableTree.new("Leaf A.1", [], 2),
    SerializableTree.new("Lef A.2", [], 2),
  ], 1),
], 0)
# puts t.to_s
# t.to_f
