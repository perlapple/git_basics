# Stack Machine Interpretation
class Minilang
  def initialize(operations)
    @operations = operations.split
    @register = 0
    @stack = []
  end

  def eval
    @operations.each do |operation|
      if integer? operation
        @register = operation.to_i
      else
        begin
          send operation.downcase
        rescue NoMethodError
          puts "Invalid token: #{operation}"
          break
        end
      end
    end
  end

  private

  def integer?(operation)
    operation.to_i.to_s == operation
  end

  def print
    puts @register
  end

  def push
    @stack.push(@register)
  end

  def mult
    @register *= @stack.pop
  end

  def add
    @register += @stack.pop
  end

  def pop
    @register = @stack.pop
  end

  def div
    @register /= @stack.pop
  end

  def mod
    @register = @register % @stack.pop
  end

  def sub
    @register -= @stack.pop
  end
end

Minilang.new('PRINT').eval
# 0
Minilang.new('5 PUSH 3 MULT PRINT').eval

Minilang.new('5 PRINT PUSH 3 PRINT ADD PRINT').eval

Minilang.new('5 PUSH 10 PRINT POP PRINT').eval

Minilang.new('5 PUSH POP POP PRINT').eval
# Empty stack!
Minilang.new('3 PUSH PUSH 7 DIV MULT PRINT ').eval
# 6
Minilang.new('4 PUSH PUSH 7 MOD MULT PRINT ').eval
# 12
Minilang.new('-3 PUSH 5 XSUB PRINT').eval
# Invalid token: XSUB
Minilang.new('-3 PUSH 5 SUB PRINT').eval
# # 8
Minilang.new('6 PUSH').eval
# # (nothing printed; no PRINT commands)
