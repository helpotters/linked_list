# lib/linked_list.rb
require_relative('./node')
# Controls the nodes
class LinkedList
  attr_reader :head, :tail

  include Nodes
  def initialize
    @head = nil
    @tail = nil
  end

  def append(value)
    return Node.new(value) if size == 0

    new_node = Node.new(value)
    last_node = case size
                when 1
                  @head
                else
                  at(size - 1)
                end
    last_node.next_node = new_node
  end

  def prepend(value)
    new_head_node = Node.new(value, @head)
    @head = new_head_node
  end

  def size
    count = 0
    current_node = @head
    until current_node.nil?
      count += 1
      current_node = current_node.next_node
    end
    count
  end

  def at(index)
    count = 0
    current_node = @head
    until count == index
      count += 1 unless size == 0
      current_node = current_node.next_node
      return current_node if count == index
    end
  end

  def pop
    return 'all gone' if size == 0

    before_node = at(size - 2) unless size == 0
    puts before_node.value
    before_node.next_node = nil
  end

  def contains?(content)
    current_node = @head
    until current_node.nil?
      return true if current_node.value == content

      current_node = current_node.next_node
    end
  end

  def find(content)
    count = 0
    current_node = @head
    until current_node.nil?
      return count if current_node.value == content

      count += 1
      current_node = current_node.next_node
    end
  end

  def to_s
    current_node = @head
    until current_node.nil?
      print "(#{current_node.value}) ->"
      current_node = current_node.next_node
    end
  end

  def insert_at(value, index)
    return 'Error' if index > size

    before_node = at(index - 1)
    after_node = at(index + 1)
    current_node = at(index)
    new_node = Node.new(value)

    before_node.next_node = new_node
    new_node.next_node = current_node
  end

  def remove_at(index)
    return 'Error' if index > size

    before_node = at(index - 1)
    after_node = at(index + 1)
    before_node.next_node = after_node # Removed from chain
  end
end
