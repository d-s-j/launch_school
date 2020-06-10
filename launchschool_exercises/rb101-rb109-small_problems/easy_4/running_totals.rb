def running_total(arr)
  totals = []
  arr.each_with_index do |num, idx|
    idx == 0 ? totals << num : totals << (num + totals[idx - 1])
  end
  totals
end

# or

def running_total(array)
  sum = 0
  array.map { |value| sum += value }
end