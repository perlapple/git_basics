
#Print all odd numbers from 1 to 99, inclusive. All numbers should be printed on separate lines.

number = 1

while number < 100
  puts number if number.odd?
  number += 1
end
