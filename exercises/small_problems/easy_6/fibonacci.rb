def find_fibonacci_index_by_length(length)
  fibonacci = [1]
  index = 0;

  loop do
    fibonacci << fibonacci.last(2).inject(:+)
    break if fibonacci[index].to_s.length == length
    index += 1
  end

  index + 1
end


p find_fibonacci_index_by_length(2) #== 7
p find_fibonacci_index_by_length(10) #== 45
p find_fibonacci_index_by_length(100) #== 476
p find_fibonacci_index_by_length(1000) #== 4782
p find_fibonacci_index_by_length(10000) #== 47847
