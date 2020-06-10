# # Group 1
# my_proc = proc { |thing| puts "This is a #{thing}." }
# puts my_proc
# puts my_proc.class
# my_proc.call # Can call even when missing argument.
# my_proc.call('cat')

# # Group 2
# my_lambda = lambda { |thing| puts "This is a #{thing}." }
# my_second_lambda = -> (thing) { puts "This is a #{thing}." }
# puts my_lambda
# puts my_second_lambda
# puts my_lambda.class # Proc class
# my_lambda.call('dog')
# my_lambda.call # Must include argument.
# my_third_lambda = Lambda.new { |thing| puts "This is a #{thing}." } # There is no Lambda class. It is a special proc object.

# # Group 3
# def block_method_1(animal)
#   yield
# end

# block_method_1('seal') { |seal| puts "This is a #{seal}."} # `animal` must be passed to yield in order to pass to block.
# block_method_1('seal') # `yield` requires a block.

# Group 4
def block_method_2(animal)
  yield(animal)
end

block_method_2('turtle') { |turtle| puts "This is a #{turtle}."}
block_method_2('turtle') do |turtle, seal| # No value is passed to `seal` block parameter.
  puts "This is a #{turtle} and a #{seal}."
end
block_method_2('turtle') { puts "This is a #{animal}."} # Need to define block parameter `animal`.