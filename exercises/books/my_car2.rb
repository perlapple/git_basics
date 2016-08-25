class MyCar2

  def initialize(year, model, color)
    @year = year
    @model = model
    @color = color
    @current_speed = 0
  end

  def speed_up(number)
    @current_speed += number
    puts "You push the gas and accelerate #{number} mph."
  end

  def brake(number)
    @current_speed -= number
    puts "You push the brake and decelerate #{number} mph."
  end

  def current_speed
    puts "You are now going #{@current_speed} mph."
  end

  def shut_down
    @current_speed = 0
    puts "Let's park this bad boy!"
  end
end

lumina = MyCar2.new(1997, 'chevy lumina', 'white')
lumina.speed_up(20)
p "current_speed #{lumina.current_speed}"
p "objet: #{lumina.inspect}"
lumina.speed_up(20)
p "#{lumina.current_speed}"
lumina.brake(20)
p "#{lumina.current_speed}"
lumina.brake(20)
p "#{lumina.current_speed}"
p "#{lumina.shut_down}"
p "#{lumina.current_speed}"
