def sequence(n)
  n.positive? ? Array.new(n) { |i| i+1 } : Array.new(-n) { |i| i--n }
end

# or

def sequence(n)
  n.positive? ? (1..n).to_a : (n..0).to_a
end

sequence(5) == [1, 2, 3, 4, 5]
sequence(3) == [1, 2, 3]
sequence(1) == [1]