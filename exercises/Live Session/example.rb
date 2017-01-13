# write a method that takes a string as argument, return the string in reverse.

def string_reverse(string)
  string.reverse
end

# puts string_reverse('Helo there! ')

# write a method that takes two arguments: the first is the starting number, and
# the second is the ending numner. Print out all numbers
# between the two number, except
# if a number is divisible by 3, print "Fizz",
# if  number is divisible by 5, print "buzz" and finally
# if a number is divisible by 3 and 5, print "fizzbuzz"

def fizzbuzz(first_number, last_number)
  result = []
  (first_number..last_number).each do |number|
    result << if (number % 3).zero? && (number % 5).zero?
                'FizzBuzz'
              elsif (number % 3).zero?
                'Fizz'
              elsif (number % 5).zero?
                'Buzz'
              else
                number
              end
  end
  puts result.join(', ')
end

# fizzbuzz(2, 15)

# Implement the search methods

PRODUCTS = [
  { name: 'Laptop 1', price: 201 },
  { name: 'Laptop 2', price: 202 },
  { name: 'Laptop 3', price: 203 },
  { name: 'Laptop 4', price: 204 },
  { name: 'Laptop 5', price: 205 },
  { name: 'Laptop 6', price: 206 },
  { name: 'Laptop 7', price: 207 },
  { name: 'Laptop 8', price: 208 },
  { name: 'Laptop 9', price: 209 },
  { name: 'thinkpad 10', price: 210 },
  { name: 'thinkpad 11', price: 211 },
  { name: 'thinkpad 10', price: 212 },
  { name: 'thinkpad 11', price: 221 }
].freeze

query = {
  price_min: 203,
  price_max: 206,
  q: 'Laptop'
}

query2 = {
  price_min: 211,
  price_max: 212,
  q: 'thinkpad'
}

def matches_filter?(query, product)
  product[:price] >= query[:price_min] &&
    product[:price] <= query[:price_max] &&
    product[:name].include?(query[:q])
end

def search(query)
  result = PRODUCTS.select { |product| matches_filter?(query, product) }
  puts result
end

search(query)
search(query2)
