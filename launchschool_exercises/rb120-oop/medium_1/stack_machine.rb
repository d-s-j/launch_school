class Minilang
  def initialize(n)
    @register = 0
    @stack = []
    @commands = n
  end

  def eval
    commands = @commands.split
    commands.each do |word|
      case word
      when 'PUSH'  then @stack.push(@register)
      when 'POP'   then @register = @stack.pop
      when 'ADD'   then @register += @stack.pop
      when 'SUB'   then @register -= @stack.pop
      when 'MULT'  then @register *= @stack.pop
      when 'DIV'   then @register /= @stack.pop
      when 'MOD'   then @register %= @stack.pop
      when 'PRINT' then @register.nil? ? puts("Empty stack!") : puts(@register)
      else
        if word.to_i != 0
          @register = word.to_i
        else
          puts "Invalid token: #{word}"
        end
      end
    end
  end
end

Minilang.new('PRINT').eval
# 0

Minilang.new('5 PUSH 3 MULT PRINT').eval
# 15

Minilang.new('5 PRINT PUSH 3 PRINT ADD PRINT').eval
# 5
# 3
# 8

Minilang.new('5 PUSH 10 PRINT POP PRINT').eval
# 10
# 5

Minilang.new('5 PUSH POP POP PRINT').eval
# Empty stack!

Minilang.new('3 PUSH PUSH 7 DIV MULT PRINT ').eval
# 6

Minilang.new('4 PUSH PUSH 7 MOD MULT PRINT ').eval
# 12

Minilang.new('-3 PUSH 5 XSUB PRINT').eval
# Invalid token: XSUB

Minilang.new('-3 PUSH 5 SUB PRINT').eval
# 8

Minilang.new('6 PUSH').eval
# (nothing printed; no PRINT commands)
