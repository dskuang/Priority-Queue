class PriorityQueue
  attr_accessor :elements

  def initialize
    @elements = [nil]
  end

  def <<(element)
    @elements << element
    bubble_up(@elements.size - 1)
  end

  def bubble_up(index)
    parent_index = (index / 2)

    # return if we reach the root element
    return if index <= 1

    # or if the parent is already greater than the child
    return if @elements[parent_index] >= @elements[index]

    # otherwise we exchange the child with the parent
    exchange(index, parent_index)

    # and keep bubbling up
    bubble_up(parent_index)
  end

  def exchange(source, target)
    @elements[source], @elements[target] = @elements[target], @elements[source]
  end

  def pop
    # exchange the root with the last element
    exchange(1, @elements.size - 1)

    # remove the last element of the list
    max = @elements.pop

    # and make sure the tree is ordered again
    bubble_down(1)
    max
  end

  def bubble_down(index)
    child_index = (index * 2)

    # stop if we reach the bottom of the tree
    return if child_index > @elements.size - 1

    # make sure we get the largest child
    not_the_last_element = child_index < @elements.size - 1
    left_element = @elements[child_index]
    right_element = @elements[child_index + 1]
    child_index += 1 if not_the_last_element && right_element > left_element

    # there is no need to continue if the parent element is already bigger
    # then its children
    return if @elements[index] >= @elements[child_index]

    exchange(index, child_index)

    # repeat the process until we reach a point where the parent
    # is larger than its children
    bubble_down(child_index)
  end

end


q = PriorityQueue.new
(0..10).each do |num|
  q << num
end

p q.elements
# q.pop
# p q.elements


class Array
	def heapsort!
		#heapify
		1.upto(self.length - 1) do |i|
			#move up
			child = i
			while child > 0
				parent = (child - 1) / 2
				if self[parent] < self[child]
					self[parent], self[child] = self[child], self[parent]
					child = parent
				else
					break
				end
			end
		end

		#sort
		i = self.length - 1
		while i > 0
			self[0], self[i] = self[i], self[0]
			i -= 1

			#move down
			parent = 0
			while parent * 2 + 1 <= i
				child = parent * 2 + 1
				if child < i && self[child] < self[child + 1]
					child += 1
				end
				if self[parent] < self[child]
					self[parent], self[child] = self[child], self[parent]
					parent = child
				else
					break
				end
			end
		end
	end
end



foo = [5, 11, 7, 2, 19, 4, 8, 22, 1, 12]
foo.heapsort!
p foo
