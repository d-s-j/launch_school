arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

arr.map do |x|
  x.sort { |a, b| b <=> a }
end