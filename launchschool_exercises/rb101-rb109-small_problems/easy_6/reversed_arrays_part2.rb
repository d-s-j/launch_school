def reverse(list)
  new_list = Array.new
  list.each_index do |idx|
    new_list[idx] = list[idx]
  end

  temp_list = []
  new_list.length.times { temp_list << new_list.pop }
  temp_list.length.times { new_list << temp_list.shift }

  new_list
end

# or

def reverse(array)
  result_array = []
  array.reverse_each { |element| result_array << element }
  result_array
end

# or

def reverse(array)
  array.inject([]) { |arr, item| arr.unshift(item) }
end