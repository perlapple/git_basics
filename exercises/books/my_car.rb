# Create a class called MyCar. When you initialize a new instance or object of
# the class, allow the user to define some instance variables that tell us the
# year, color, and model of the car. Create an instance variable that is set to 0
# during instantiation of the object to track the current speed of the car as well.
# Create instance methods that allow the car to speed up, brake, and shut the car off.

# Add an accessor method to your MyCar class to change and view the color of your car.
# Then add an accessor method that allows you to view, but not modify, the year of your car.



class My_Car
  attr_accessor :color, :model, :speed
  attr_reader :year
  def initialize(year, color, model)
  @year = year
  @color = color
  @model = model
  @speed = 0
  end

  def speed_up(velocity)
    self.speed += velocity
  end

  def brake(velocity)
    self.speed -= velocity
  end

  def shutdown
    self.speed = 0
  end

  def spray_paint(color)
    self.color = color
  end
end

mazda = My_Car.new('2012', 'brown', 'Mazda')
mazda.speed_up(80)
mazda.brake(10)
#mazda.shutdown
puts mazda.speed
mazda.color = "green"
puts mazda.color
puts mazda.year
