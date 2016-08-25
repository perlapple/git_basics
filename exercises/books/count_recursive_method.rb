#Write a method that counts down to zero using recursion.

def count_down(number)
  p "#{number}"
  count_down(number-1) if number != 0
end

p "Enter a number:"
number = gets.chomp.to_i

count_down(number)
