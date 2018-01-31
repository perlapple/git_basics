
def count_occurrences(vehicles)

  vehicules_count = Hash.new

  vehicles.uniq.each { |index|
  vehicules_count[index] = vehicles.count { |x| x == index } #=> 3
#  vehicules_count[index] = count unless vehicules_count.has_key?(index)
  }

  vehicules_count.each do |element, count|
      puts "#{element} => #{count}"
    end

end

vehicles = ['car', 'car', 'truck', 'car', 'SUV', 'truck', 'motorcycle', 'motorcycle', 'car', 'truck']

count_occurrences(vehicles)


# car => 4
# truck => 3
# SUV => 1
# motorcycle => 2
