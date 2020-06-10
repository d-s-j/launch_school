def swapcase(str)
    str.chars.map do |letter|
      ('a'..'z').include?(letter) ? letter.upcase : letter.downcase
    end.join
end