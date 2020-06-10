def staggered_case(str)
  str.chars.each_with_index.map do |letter, index|
    index.even? ? letter.upcase : letter.downcase
  end.join
end