puts "What is the bill?"
bill = gets.to_f

puts "What is the tip percentage?"
tip = ((gets.to_f * 0.01) * bill).round(2)

total = (bill + tip).round(2)

puts "=> The tip is $#{'%.2f' % tip}"
puts "=> The total is $#{'%.2f' % total}"