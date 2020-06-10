def stringy(num)
  str = []
  loop do
    str.size == num ? break : str << '1'
    str.size == num ? break : str << '0'
  end
  str.join
end

# or

def stringy(num)
  str = []
  num.times do |n|
    n.even? ? str << '1' : str << '0'
  end
  str.join
end

# or

def stringy(num)
  Array.new(num) { |i| i.even? ? '1' : '0' }.join
end

# Further Exploration

def stringy(num, first = 1)
  str = []
  
  if first == 1
    num.times do |n|
      n.even? ? str << '1' : str << '0'
    end
  elsif first == 0
    num.times do |n|
      n.odd? ? str << '1' : str << '0'
    end
  end

  str.join
end