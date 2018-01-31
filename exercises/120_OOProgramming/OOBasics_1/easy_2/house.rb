class House
include Comparable
 attr_reader :price

 def initialize(price)
   @price = price
 end

def <=>(comparison_home)
puts "\n******* #{@price} < #{comparison_home.price}"
@price <=> comparison_home.price
end
end

home1 = House.new(100_000)
home2 = House.new(150_000)
home1 < home2
home2 < home1