#examples
module Fuel
  attr_accessor :speed, :heading
  
  def range
    return (@fuel_capacity * @fuel_efficiency) + 10 if self.kind_of? AquaticVehicle
    @fuel_capacity * @fuel_efficiency
  end
end

class WheeledVehicle
  include Fuel

  def initialize(tire_array, km_traveled_per_liter, liters_of_fuel_capacity)
    @tires = tire_array
    @fuel_efficiency = km_traveled_per_liter
    @fuel_capacity = liters_of_fuel_capacity
  end

  def tire_pressure(tire_index)
    @tires[tire_index]
  end

  def inflate_tire(tire_index, pressure)
    @tires[tire_index] = pressure
  end
end

class Auto < WheeledVehicle
  def initialize
    # 4 tires are various tire pressures
    super([30,30,32,32], 50, 25.0)
  end
end

class Motorcycle < WheeledVehicle
  def initialize
    # 2 tires are various tire pressures
    super([20,20], 80, 8.0)
  end
end

class AquaticVehicle
  include Fuel
  
  attr_accessor :propeller_count, :hull_count
 
  def initialize(num_propellers, num_hulls, km_traveled_per_liter, liters_of_fuel_capacity)
    @num_propellers = num_propellers
    @num_hulls = num_hulls
    @fuel_efficiency = km_traveled_per_liter
    @fuel_capacity = liters_of_fuel_capacity
  end
end
  
class Catamaran < AquaticVehicle
end

class Motorboat < AquaticVehicle
  def initialize(km_traveled_per_liter, liters_of_fuel_capacity)
    super(1, 1, km_traveled_per_liter, liters_of_fuel_capacity)
  end
end

a = Auto.new
p a.range

v = Catamaran.new(1,2,3,4)
#p v.range
p v.range

m = Motorboat.new(2,10)
p m.range