# @var - is an instance variable
# @@var - is a class (static) variable
class Tree
  attr_accessor :children, :node_name, :level

  def initialize(node_name, children = [], level = 0)
    @node_name = node_name
    @children = children
    @level = level
  end

  def visit_all(&block)
    visit(&block)
    children.each { |node| node.visit_all(&block) } if has_children?
  end

  def visit(&block)
    block.call self
  end

  def has_children?
    @children.length > 0
  end
end

t = Tree.new("root", [Tree.new("Leaf A",
                               [Tree.new("Leaf A.1"), Tree.new("Lef A.2")])])
# t.visit_all { |node| puts "Visited #{node.node_name}" }
