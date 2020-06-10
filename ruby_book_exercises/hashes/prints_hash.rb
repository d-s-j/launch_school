animals = {cat: "meow", dog: "bark", cow: "moo"}

animals.each_key { |x| puts x }
animals.each_value {|x| puts x }
animals.each { |k, v| puts "#{k} goes #{v}." }