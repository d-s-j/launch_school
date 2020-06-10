def substrings_at_start(str)
  str.chars.map.with_index { |_, i| str[0, i + 1] }
end

def substrings(str)
  str.chars.each_with_index.with_object([]) do |(_, i), arr|
    arr.concat(substrings_at_start(str[i..-1]))
  end
end

def palindromes(str)
  substrings(str).select do |string|
    string == string.reverse && string.length > 1
  end
end

palindromes('abcd') == []
palindromes('madam') == ['madam', 'ada']
palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]