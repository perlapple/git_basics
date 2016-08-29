
my_car =  { type: "sedan", color: "blue", mileage: 80_000}

my_car[:year] = 2012

my_car.delete(:mileage)

p my_car

puts "#{my_car[:color]}"
