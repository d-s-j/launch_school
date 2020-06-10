# -Combining Names-
first_name = 'John'
last_name = 'Doe'
# puts full_name = first_name + " " + last_name

puts first_name.insert(-1, " " + last_name)
puts first_name.concat(" ", last_name)
puts full_name = [first_name, last_name].join(' ')