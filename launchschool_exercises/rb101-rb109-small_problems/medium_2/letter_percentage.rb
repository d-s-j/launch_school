=begin
  Input: string
  -initiate a hash  
  -split string
  -iterate through string
    -if string == lowercase, append to lowercase key in hash
    -if string == uppercase, append to uppercase key in hash
    -if string is 'else', append to neither key in hash
  -iterate through each value, change count-value into percentage-value
  Output: hash, which contains 3 entries:
    -% lowercase, % uppercase, % neither
=end

def letter_percentages(str)
  counter = { lowercase: 0, uppercase: 0, neither: 0 }
  str_length = str.size

  str.each_char do |chr|
    case
    when ('a'..'z').include?(chr) then counter[:lowercase] += 1
    when ('A'..'Z').include?(chr) then counter[:uppercase] += 1
    else                               counter[:neither] += 1
    end
  end

  calculate_percentage(counter, str_length)
end

def calculate_percentage(hsh, length)
  hsh.each do |k,v|
    hsh[k] = ((v/length.to_f) * 100).round(2)
  end
end

# Test
letter_percentages('abCdef 123') == { lowercase: 50, uppercase: 10, neither: 40 }
letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25 }
letter_percentages('123') == { lowercase: 0, uppercase: 0, neither: 100 }

# Launch Schools Solution:
def letter_percentages(string)
  counts = { lowercase: 0, uppercase: 0, neither: 0 }
  percentages = { lowercase: [], uppercase: [], neither: [] }
  characters = string.chars
  length = string.length

  counts[:uppercase] = characters.count { |char| char =~ /[A-Z]/ }
  counts[:lowercase] = characters.count { |char| char =~ /[a-z]/ }
  counts[:neither] = characters.count { |char| char =~ /[^A-Za-z]/ }

  calculate(percentages, counts, length)

  percentages
end

def calculate(percentages, counts, length)
  percentages[:uppercase] = (counts[:uppercase] / length.to_f) * 100
  percentages[:lowercase] = (counts[:lowercase] / length.to_f) * 100
  percentages[:neither] = (counts[:neither] / length.to_f) * 100
end