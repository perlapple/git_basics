
module Speaks
  def print_name(name)
    puts name
  end
end

class HumanBeing
  include Speaks
end

perla = HumanBeing.new
perla.print_name("Hello")
