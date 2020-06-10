def halvsies(arr)
    arr.each_slice((arr.size/2.0).round).to_a
end

# or

def halvsies(array)
  middle = (array.size / 2.0).ceil
  first_half = array.slice(0, middle)
  second_half = array.slice(middle, array.size - middle)
  [first_half, second_half]
end