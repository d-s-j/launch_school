def crunch(str)
  new_str = ""
  str.chars.each_with_index do |letter, idx|
    new_str << letter if letter != str[idx+1]
  end
  new_str
end

def crunch(str)
  new_str = ''
  index = 0
  str.each_char do |letter|
    if letter != str[index+1]
      new_str << letter
      index += 1
    else
      index += 1
    end
  end
  new_str
end