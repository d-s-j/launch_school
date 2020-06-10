def buy_fruit(fruits)
  list = []
  fruits.each do |arr|
    arr[1].times { list << arr[0] }
  end
  list
end

# or

def buy_fruit(list)
  list.each_with_object([]) do |(fruit, quantity), new_list|
    quantity.times { new_list << fruit }
  end
end

# or

def buy_fruit(list)
  list.map { |fruit, quantity| [fruit] * quantity }.flatten
end

buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]


=begin
-input: array with nested arrays > first element 'fruit', second element int.
-initiate a new array
-iterate through each nested array
  -push first element by 'x' amount of times, based off second element integer.
-return new array
=end
