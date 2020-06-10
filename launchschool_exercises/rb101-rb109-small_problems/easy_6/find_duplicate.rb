def find_dup(arr)
  hsh = arr.each_with_object (Hash.new(0)) do |item, hash|
    hash[item] += 1
  end
  hsh.each_pair { |k, v| return k if v > 1 }
end

# or 

def find_dup(array)
  array.find { |element| array.count(element) == 2 }
end