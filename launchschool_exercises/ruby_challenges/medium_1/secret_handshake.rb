# class SecretHandshake
#   attr_reader :input

#   def initialize(input)
#     @input = to_binary(input)
#   end

#   def to_binary(obj)
#     obj.class == Integer ? obj.to_s(2).to_i : obj.to_i
#   end

#   def commands
#     result = []

#     wink = input % 10
#     result << 'wink' if !wink.zero?

#     double_blink = (input % 100) / 10
#     result << 'double blink' if !double_blink.zero?

#     close_your_eyes = (input % 1000) / 100
#     result << 'close your eyes' if !close_your_eyes.zero?

#     jump = (input % 10000) / 1000
#     result << 'jump' if !jump.zero?

#     reverse = input / 10000
#     result.reverse! if !reverse.zero?

#     result
#   end
# end

### Refactored:

class SecretHandshake
  attr_reader :input

  def initialize(input)
    @input = to_binary(input)
  end

  def to_binary(obj)
    obj.class == Integer ? obj.to_s(2) : obj.to_i.to_s
  end

  def commands
    result = []
    result << 'wink' if input[-1] == '1'
    result << 'double blink' if input[-2] == '1'
    result << 'close your eyes' if input[-3] == '1'
    result << 'jump' if input[-4] == '1'
    result.reverse! if input[-5] == '1'
    result
  end
end

a = SecretHandshake.new('10012')
p a.commands