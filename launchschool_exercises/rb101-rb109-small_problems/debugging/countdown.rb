=begin
  Our countdown to launch isn't behaving as expected. 
  Why? Change the code so that our program successfully counts down from 10 to 1.
=end

def decrease(counter)
  counter -= 1
end

counter = 10

10.times do
  puts counter
  decrease(counter)
end

puts 'LAUNCH!'

# Solution:
def decrease(counter)
  counter - 1 # remove reassignment, since unnecessary
end

counter = 10

10.times do
  puts counter
  counter = decrease(counter) # reassign 'counter' with return value of method
end

puts 'LAUNCH!'