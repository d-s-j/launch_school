def penultimate(str)
  str.split[-2]
end

penultimate('last word') == 'last'
penultimate('Launch School is great!') == 'is'

def retrieve_middle(str)
  arr = str.split
  if arr.length < 3
    "String must be 3 words or more."
  else
    arr.length.odd? ? arr[arr.length/2] : "#{arr[arr.length/2 - 1]} #{arr[arr.length/2]}"
  end
end
