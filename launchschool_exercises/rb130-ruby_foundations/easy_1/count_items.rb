def count(collection)
  counter = 0
  collection.each do |x|
    counter += 1 if yield(x)
  end
  counter
end

p count([1,2,3,4,5]) { |value| value.odd? } == 3
p count([1,2,3,4,5]) { |value| value % 3 == 1 } == 2
p count([1,2,3,4,5]) { |value| true } == 5
p count([1,2,3,4,5]) { |value| false } == 0
p count([]) { |value| value.even? } == 0
p count(%w(Four score and seven)) { |value| value.size == 5 } == 2

Further Exploration:

def count(collection)
  counter = 0
  0.upto(collection.size - 1) do |idx|
    counter += 1 if yield(collection[idx])
  end
  counter
end
