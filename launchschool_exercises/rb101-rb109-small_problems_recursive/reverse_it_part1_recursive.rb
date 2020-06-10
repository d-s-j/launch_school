=begin
  -input: string argument
  -output: returns new string, words in reverse order.

  DEF reverse_sentence( string, new_string = [] )
    IF string.empty? then
      RETURN new_string.join(' ')
    ELSE do
      new_string << string.split[-1]
      call reverse_sentence( string.split[0..-2].join(' '), new_string )
    END IF
  END DEF
=end

def reverse_sentence(str, new_str = [])
  if str.empty?
    new_str.join(' ')
  else
    new_str << str.split[-1]
    reverse_sentence(str.split[0..-2].join(' '), new_str)
  end
ends

# Examples:
puts reverse_sentence('') == ''
puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'
