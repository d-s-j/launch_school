# Recursion - the ability to call a method from within itself.

def countdown(number)
  puts number
    if number > 0
      countdown(number - 1)
    end
end

puts "Type any number."
number = gets.chomp.to_i
countdown(number)