(1..99).each { |x| p x if x.odd? }

# or

counter = 1
until counter > 99
  puts counter
  counter += 2
end