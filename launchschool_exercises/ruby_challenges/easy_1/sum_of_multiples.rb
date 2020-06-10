# class SumOfMultiples
#   attr_reader :numbers

#   def initialize(*num)
#     @numbers = num
#   end

#   def self.to(n)
#     [3, 5].each_with_object([]) do |num, multiples|
#       multiple = num
#       until multiple >= n
#         multiples << multiple
#         multiple += num
#       end
#     end.uniq.sum
#   end

#   def to(n)
#     numbers.each_with_object([]) do |num, multiples|
#       multiple = num
#       until multiple >= n
#         multiples << multiple
#         multiple += num
#       end
#     end.uniq.sum
#   end
# end

### Refactor:

class SumOfMultiples
  attr_reader :multiples

  def initialize(*multiples)
    @multiples = multiples
  end

  def to(limit)
    (1...limit).select do |number|
      multiple?(number, multiples)
    end.sum
  end

  def self.to(limit)
    (1...limit).select do |number|
      self.new.multiple?(number)
    end.sum
  end

  def multiple?(num, arr = [3, 5])
    arr.any? { |multiple| (num % multiple).zero? }
  end
end
