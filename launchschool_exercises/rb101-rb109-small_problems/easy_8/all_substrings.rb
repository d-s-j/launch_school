def substrings(str)
  substrings = []
  str.length.times do
    str.chars.map.with_index do |_, i|
      substrings << str[0, i + 1]
    end
    str.slice!(0)
  end
  substrings
end

# or

def substrings_at_start(str)
  str.chars.map.with_index { |_, i| str[0, i + 1] }
end

def substrings(str)
  str.chars.each_with_index.with_object([]) do |(_, i), arr|
    arr.concat(substrings_at_start(str[i..-1]))
  end
end

substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde', 
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]