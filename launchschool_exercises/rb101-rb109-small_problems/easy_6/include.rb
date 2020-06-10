def include?(array, value)
  array.any?(value)
end

# or

def include?(array, value)
  !!array.find_index(value)
end