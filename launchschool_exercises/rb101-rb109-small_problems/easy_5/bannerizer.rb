def print_in_box(str)
  puts '+ ' + ('-' * str.length) + ' +'
  puts '| ' + (' ' * str.length) + ' |'
  puts '| ' + str + ' |'
  puts '| ' + (' ' * str.length) + ' |'
  puts '+ ' + ('-' * str.length) + ' +'
end

# or

def print_in_box(str)
  horizontal_rule = "+#{'-' * (str.size + 2)}+"
  empty_line = "|#{' ' * (str.size + 2)}|"

  puts horizontal_rule
  puts empty_line
  puts "| #{str} |"
  puts empty_line
  puts horizontal_rule
end