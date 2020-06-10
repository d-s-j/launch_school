def oddities(arr)
  new_arr = []
  arr.each_with_index do |num, index| 
  new_arr << num if index.even? 
  end

  new_arr
end