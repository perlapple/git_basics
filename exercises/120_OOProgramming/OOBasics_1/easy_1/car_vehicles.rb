class Vehicles
  attr_reader :make, :model, :wheels

  def initialize(make, model, wheels)
    @make = make
    @model = model
    @wheels = wheels
  end
  
  def to_s
    "#{make} #{model}"
  end
end

class Car < Vehicles
  def initialize(make, model)
    super(make, model, 4)
  end
end

class Motorcycle < Vehicles
  def initialize(make, model)
    super(make, model, 2)
  end
end

class Truck < Vehicles
  attr_reader :payload

  def initialize(make, model, payload)
    super(make, model, 6)
    @payload = payload
  end
end

p Car.new('2012', 'Mazda')
p Motorcycle.new('2000', 'Thosiba')
p Truck.new('100', 'llk', 'payload1')
