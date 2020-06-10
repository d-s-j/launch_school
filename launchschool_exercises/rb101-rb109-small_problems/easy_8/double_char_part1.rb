def repeater(str)
  double = ''
  str.each_char { |chr| double << chr * 2 }
  double
end

# or

def repeater(str)
  str.chars.map { |chr| chr * 2 }.join
end

# or

def repeater(str)
  str.chars.zip(str.chars).join
end

repeater('Hello') == "HHeelllloo"
repeater("Good job!") == "GGoooodd  jjoobb!!"
repeater('') == ''
