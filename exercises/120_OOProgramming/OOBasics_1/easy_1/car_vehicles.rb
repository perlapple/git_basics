class Vehicles
     attr_reader :make, :model

  def initialize(make, model, wheels)
    @make = make
    @model = model
    @wheels = wheels
  end

  def wheels
    @wheels
  end

  def to_s
    "#{make} #{model}"
  end
end

class Car < Vehicles
 def initialize(make, model)
   super(make,model, 4)
  end
end

class Motorcycle < Vehicles
  attr_reader :make, :model

  def initialize(make, model)
    super(make,model, 2)
  end
end

class Truck < Vehicles
  attr_reader :make, :model, :payload

  def initialize(make, model, payload)
    super(make, model, 6)
    @payload = payload
  end
end

p car = Car.new("2012", "Mazda")
p moto = Motorcycle.new("2000", "Thosiba")
p  truck = Truck.new("100", "llk", "payload1")

