# class WordProblem
#   OPERATORS = {
#     'plus' => :+,
#     'minus' => :-,
#     'multiplied' => :*,
#     'divided' => :/
#   }

#   def initialize(problem)
#     @problem = problem.downcase.split[2..-1]
#   end

#   def answer
#     @problem.delete('by')
#     @problem.map! do |item|
#       if OPERATORS.keys.include?(item)
#         OPERATORS[item]
#       else
#         item.to_i
#       end
#     end

#     result = 0
#     first = true
#     until @problem.empty?
#       if first
#         raise ArgumentError if @problem[0].class != Integer || !OPERATORS.values.include?(@problem[1])
#         result += (@problem[0].send @problem[1], @problem[2])
#         @problem.shift(3)
#         first = false
#       else
#         raise ArgumentError if @problem[1].class != Integer || !OPERATORS.values.include?(@problem[0])
#         result = result.send @problem[0], @problem[1]
#         @problem.shift(2)
#       end
#     end

#     result
#   end
# end

# Refactored:

class WordProblem
  OPERATORS = {
    'plus' => :+,
    'minus' => :-,
    'multiplied' => :*,
    'divided' => :/
  }

  def initialize(problem)
    @problem = problem
  end

  def answer
    numbers = @problem.scan(/-*\d+/).map(&:to_i)
    operations = @problem.scan(/plus|minus|multiplied|divided/)

    raise ArgumentError unless valid?(numbers, operations)

    total = numbers.shift
    numbers.each_index do |index|
      total = total.send OPERATORS[operations[index]], numbers[index]
    end
    
    total
  end

  def valid?(numbers, operations)
    !numbers.empty? && !operations.empty? && numbers.size - operations.size == 1
  end
end