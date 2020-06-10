=begin
method_slices
  input: string of digits
  output: array of nested arrays containing integers
  notes: -string to integer
         -return a nested array(possible consecutive numbers of length `n`)

  initialize array = []
  iterate through string( by index )
    array << [index to index + n]
  iterate END when index + n = string.length - 1
  
  iterate through array `EACH`
    iterate/transform through nested_array `MAP`
      convert string to integer
    iterate end
  iterate end

  return array
=end

### Original:
# class Series
#   def initialize(str_of_digits)
#     @digits = str_of_digits
#   end

#   def slices(n)
#     raise ArgumentError, 'Argument is too big.' if n > @digits.size

#     array = []
#     @digits.size.times do |idx| 
#       array << @digits[idx..(idx + n - 1)].chars unless @digits[idx + n - 1].nil?
#     end

#     array.each do |arr|
#       arr.map!(&:to_i)
#     end
#   end
# end

### Refactored:
class Series
  def initialize(str_of_digits)
    @digits = str_of_digits
  end

  def slices(n)
    if n > digits.length
      raise ArgumentError, 'Argument is too big.'
    else
      digits.each_char.map(&:to_i).each_cons(n).to_a
    end
  end

  private

  attr_reader :digits
end