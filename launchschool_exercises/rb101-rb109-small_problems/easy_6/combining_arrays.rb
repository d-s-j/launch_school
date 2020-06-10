def merge(a, b)
  (a + b).uniq
end

# or 

def merge(a, b)
  a | b
end

# or 

def merge(*a)
  a.flatten.uniq
end 