# -Confucius Says-
def get_quote(person)
  if person == 'Yoda'
    'Do. Or do not. There is no try.'
  elsif person == 'Confucius'
    'I hear and I forget. I see and I remember. I do and I understand.'
  elsif person == 'Einstein'
    'Do not worry about your difficulties in Mathematics. I can assure you mine are still greater.'
  end
end
# Edited into one if statement, to have a implicit return value. 
# Prior was returning the value of the last line of code, which was 'nil' when argument was not 'Einstein'.

puts 'Confucius says:'
puts '"' + get_quote('Confucius') + '"'