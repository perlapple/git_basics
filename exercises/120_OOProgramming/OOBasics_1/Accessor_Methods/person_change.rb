# # Accept a string containing a first and last name.
class Person
  def name=(name)
    @firstname, @lastname = name.split(' ')
  end

  def name
    @firstname + ' ' + @lastname
  end
end

person1 = Person.new
person1.name = 'John Doe'
puts person1.name
