# CircularQueue
class CircularQueue
  attr_accessor :queue, :recently_added, :oldest_added

  def initialize(length)
    @queue = Array.new(length)
    @recently_added = 0
    @oldest_added = 0
  end

  def dequeue
    # guard clause
    return nil if empty?

    last_item = @queue[@oldest_added]
    @queue[@oldest_added] = nil
    advance_oldest_added_position

    last_item
  end

  def enqueue(value)
    advance_oldest_added_position if full?

    @queue[@recently_added] = value
    advance_recently_added_position
  end

  private

  def full?
    @queue.compact.length == @queue.length
  end

  def empty?
    @queue.compact.length.zero?
  end

  def advance_oldest_added_position
    @oldest_added = (@oldest_added + 1) % @queue.length
  end

  def advance_recently_added_position
    @recently_added = (@recently_added + 1) % @queue.length
  end
end

queue = CircularQueue.new(3)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2
queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil

queue = CircularQueue.new(4)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 4
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil
