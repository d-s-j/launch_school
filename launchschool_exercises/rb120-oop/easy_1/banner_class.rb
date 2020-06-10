# Complete this class so that the test cases shown below work as intended. 
# You are free to add any methods or instance variables you need. However, 
# do not make the implementation details public.

# You may assume that the input will always fit in your terminal window.

class Banner
  def initialize(message, width=message.size)
    @width = width
    @message = message
  end

  def to_s
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
  end

  private

  def adjust_message(message, width)
    message[0...width].center(width)
  end

  def empty_line
    "| #{' ' * @width} |"
  end

  def horizontal_rule
    "+-#{'-' * @width}-+"
  end

  def message_line
    "| #{adjust_message(@message, @width)} |"
  end
end

banner = Banner.new('To boldly go where no one has gone before.', 5)
puts banner

banner = Banner.new('', 0)
puts banner