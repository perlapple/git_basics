
def print_in_box(string)

  horizontal_size =  string.size + 4

  horizontal = "+ #{'-' * horizontal_size} +"
  vertical = "| #{' ' * horizontal_size} |\n|  #{string}  |"

  puts horizontal
  puts vertical
  puts horizontal

end

print_in_box('To boldly go where no one has gone before.')
