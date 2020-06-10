def sequence(count, num)
  arr = []
  count.times { |idx| arr << ((idx + 1) * num) }
  arr
end

# or

def seqeunce(count, num)
  Array.new(count) { |idx| (idx + 1) * num }
end

# or

def sequence(count, num)
  (1..count).map { |value| value * num }
end

sequence(5, 1) == [1, 2, 3, 4, 5]
sequence(4, -7) == [-7, -14, -21, -28]
sequence(3, 0) == [0, 0, 0]
sequence(0, 1000000) == []