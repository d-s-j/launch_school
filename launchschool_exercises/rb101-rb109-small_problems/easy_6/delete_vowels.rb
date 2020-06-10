def remove_vowels(arr)
  arr.map do |str|
    str.gsub(/[aeiou]/i, '')
  end
end