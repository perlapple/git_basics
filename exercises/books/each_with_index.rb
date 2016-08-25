#Use the each_with_index method to iterate through an array of your creation that prints each index and value of the array.
colors=["blue","yellow","red","white","magenta","green"]

colors.each_with_index do |name, index|
  p "#{index + 1}. #{name}"
end
