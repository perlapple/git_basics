class House
  include Comparable
  attr_reader :price

  def initialize(price)
    @price = price
  end

  def <=>(other)
    @price <=> other.price
  end
end

home1 = House.new(100_000)
home2 = House.new(150_000)
p home1 < home2
p home2 < home1
