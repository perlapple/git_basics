# Update the following code so that, instead of printing the values, each statement prints the name of the class to which it belongs.
puts "Hello".class
puts 5.class
puts [1, 2, 3].class

module Walkable
  def walk
    p 'Let\'s go got a Walk!'
  end
end

# Create an empty class named Cat.
class Cat
  include Walkable
  attr_accessor :name
  def initialize(name)
    self.name = name
  end

  def greet
    puts "Hello! My name is #{self.name}!"
  end
end

#Using the code from the previous exercise, create an instance of Cat and assign it to a variable named kitty.
#Using the code from the previous exercise, add an #initialize method that prints I'm a cat! when a new Cat object is initialized.
#Using the code from the previous exercise, add a parameter to #initialize that provides a name for the Cat object. Use an instance variable to print a greeting with the provided name. (You can remove the code that displays I'm a cat!.)
kitty = Cat.new('Sophie')
#Using the code from the previous exercise, move the greeting from the #initialize method to an instance method named #greet that prints a greeting when invoked.
kitty.greet
kitty.name = 'Luna'
kitty.greet

#Using the following code, create a module named Walkable that contains a method named #walk. This method should print Let's go for a walk! when invoked. Include Walkable in Cat and invoke #walk on kitty.
kitty.walk
