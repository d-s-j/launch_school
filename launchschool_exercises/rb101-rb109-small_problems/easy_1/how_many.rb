vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

def count_occurrences(arr)
  count = arr.each_with_object(Hash.new(0)) do |item, hsh|
    hsh[item] += 1
  end
  count.each { |k, v| puts "#{k} => #{v}" }
end

count_occurrences(vehicles)