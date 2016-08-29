# low_or_nothing.rb

numbers = {
  high:   100,
  medium: 50,
  low:    10
}

low_numbers = numbers.select! do |key, value|
                 value < 25
               end

p low_numbers
p numbers


Car

type	color	year
sedan	blue	2003
Truck

type	color	year
pickup	red	1998

hash = {
cars: {type: "sedan", color: "blue", year: 2003},
trucks: {type: "pickup", color: "red", year: 1998}
}
