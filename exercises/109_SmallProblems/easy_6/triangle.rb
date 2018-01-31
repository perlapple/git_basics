def triangle(number)
  stars = Array.new(number, ' ')
  index = number - 1

  number.times do
    stars[index] = "*"
    index -= 1
    puts stars.join
  end
end

triangle(6)
