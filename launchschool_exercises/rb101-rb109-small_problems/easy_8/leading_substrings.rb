def substrings_at_start(str)
  sub_strings = ''
  result = []
  str.each_char do |chr|
    sub_strings += chr
    result << sub_strings
  end
  result
end

# or

def substrings_at_start(str)
  str.chars.map.with_index { |_, i| str[0, i + 1] }
end

substrings_at_start('abc') == ['a', 'ab', 'abc']
substrings_at_start('a') == ['a']
substrings_at_start('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']