def interleave(a, b)
  arr = []
  a.size.times do |idx|
    arr << a[idx] << b[idx]
  end
  arr
end

# or

def interleave(a, b)
  a.zip(b).flatten
end