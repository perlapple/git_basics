#Create a class called MyCar. When you initialize a new instance or object of the class,
#allow the user to define some instance variables that tell us the year, color, and model of the car.
#Create an instance variable that is set to 0 during instantiation of the object to track the current speed of the car as well.
#Create instance methods that allow the car to speed up, brake, and shut the car off.

class MyCar
  attr_accessor :color, :model, :speed
  attr_reader :year
  @@gas = 0

  def self.show_gas()
    puts @@gas
  end

  def initialize(year, color, model, gas)
    @year = year
    @color = color
    @model = model
    @speed = 0
    @@gas += gas
  end

  def to_s()
    puts "My Car year #{ @year } color #{@color} model #{@model} speed #{@speed}"
  end

  def speed_up(rate)
    self.speed = @speed + rate
  end

  def slow_down(rate)
    self.speed = @speed - rate
  end

  def shutdown()
    self.speed = 0
  end

  def spray_paint(color)
    self.color = color
  end
end

car = MyCar.new(2016, "black", "Mazda", 23)
car2 = MyCar.new(2016, "black", "Mazda", 10)

p "#{car.inspect}"

puts MyCar.show_gas
car.to_s
