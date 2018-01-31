class Person
  attr_reader :name

  def initialize(name)
    @name = name
  end

  protected
  attr_writer:name

end

person1 = Person.new('James')
person1.name.reverse!
puts person1.name
