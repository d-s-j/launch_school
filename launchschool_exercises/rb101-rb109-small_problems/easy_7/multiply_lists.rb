def multiply_list(arr1, arr2)
  arr1.map.with_index do |num, idx|
    num * arr2[idx]
  end
end

# or

def multiply_list(arr1, arr2)
  arr1.zip(arr2).map { |arr| arr.inject(:*) }
end