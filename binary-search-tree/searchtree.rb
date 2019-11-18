# binary node class
class Node
    attr_reader :value
    attr_accessor :left, :right

    def initialize(value = nil)
        @value = value
        left = nil
        right = nil
    end
end

# binary search tree
class BinarySearchTree
    attr_accessor :root_node

    def initialize(root_value = nil)
        @root_node = Node.new(roo_tvalue)
    end

    # create a new binary search tree with x nums
    def create_new_tree(num_of_elements)
        # create an arry the size of requested elements
        number_of_nodes = (0...num_of_elements).to_a.shuffle
        # create a new binary search tree
        tree = BinarySearchTree.new
        # insert each number into the tree
        number_of_nodes.each |x| do
            tree.insert(x)
        end
    end

    # insert a number into the tree
    def insert(node, value)
        if node.value == value
			return node 
		elsif value < node.value
			insert(node.left, value)
		elsif value > node.value
			insert(node.right, value)
		else
			return node = Node.new(value)
		end
    end

    # search for a node
    def search(value, node)
        return nil if node.nil?
  
        if value == node.value 
            return node
        elsif value > node.value
            search(value, node.right)
        else value < node.value
            search(value, node.left) 		
        end
    end
end