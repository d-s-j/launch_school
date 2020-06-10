=begin
  input: string containing one or more words
  output: reverse characters in word if word has 5 or more characters

  DEF reverse_words( string, result = [] )
    IF string.empty? == true then
      return result.join(' ')
    ELSIF string.split.first.length < 5 then
      result << string.split.first
      reverse_words( string.split[1..-1].join(' '), result )
    ELSE
      result << string.split.first.reverse
      reverse_words( string.split[1..-1].join(' '), result )
    END IF
  END DEF
=end

def reverse_words(str, result = [])
  if str.empty?
    result.join(' ')
  elsif str.split.first.length < 5
    result << str.split.first
    reverse_words(str.split[1..-1].join(' '), result)
  else
    result << str.split.first.reverse
    reverse_words(str.split[1..-1].join(' '), result)
  end
end

# Examples:
puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS