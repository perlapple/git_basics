require 'set'
require 'pp'

class Pet
  attr_accessor :species, :name

  def initialize(species, name)
    @species = species
    @name = name
  end
end

class Owner
  attr_reader :name, :pets

  def initialize(name)
    @name = name
    @pets = []
  end

  def number_of_pets
    @pets.length
  end
end

class Shelter
  attr_accessor :owners_who_have_adopted
  attr_accessor :adoptions

  def initialize
    @owners_who_have_adopted = Set.new
    @adoptions = []
  end

  def adopt(owner, pet)
    owner.pets.push(pet)
    @owners_who_have_adopted.add(owner)
    @adoptions.push({ owner: owner, pet: pet })
  end

  def print_adoptions
    @owners_who_have_adopted.each do |owner|
      puts "#{owner.name} has adopted the following pets:"

      owner.pets.each do |pet|
        puts "a #{pet.species} named #{pet.name}"
      end
    end
  end

  def print_adoptions_2
    owners_who_have_adopted = {}
    adoptions.each do |adoption|
      owners_who_have_adopted[adoption[:owner].name] ||= []
      owners_who_have_adopted[adoption[:owner].name].push(adoption[:pet])
    end

    pp owners_who_have_adopted

    owners_who_have_adopted.each do |owner_name, pets|
      puts "#{owner_name} has adopted the following pets:"

      pets.each do |pet|
        puts "a #{pet.species} named #{pet.name}"
      end
    end
  end
end

butterscotch = Pet.new('cat', 'Butterscotch')
pudding      = Pet.new('cat', 'Pudding')
darwin       = Pet.new('bearded dragon', 'Darwin')
kennedy      = Pet.new('dog', 'Kennedy')
sweetie      = Pet.new('parakeet', 'Sweetie Pie')
molly        = Pet.new('dog', 'Molly')
chester      = Pet.new('fish', 'Chester')

phanson = Owner.new('P Hanson')
bholmes = Owner.new('B Holmes')

shelter = Shelter.new
shelter.adopt(phanson, butterscotch)
shelter.adopt(phanson, pudding)
shelter.adopt(phanson, darwin)
shelter.adopt(bholmes, kennedy)
shelter.adopt(bholmes, sweetie)
shelter.adopt(bholmes, molly)
shelter.adopt(bholmes, chester)

s2 = Shelter.new
aris = Pet.new("dog", "Aris")
s2.adopt(bholmes, aris)

shelter.print_adoptions
# puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
# puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."
puts "\n\n"
shelter.print_adoptions_2
