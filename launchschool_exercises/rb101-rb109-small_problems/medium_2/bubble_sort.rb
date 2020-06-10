=begin
  -Use bubble sort algorithm to sort the input
  Input: array
  
  -initiate variable(n) for array length
  
  -LOOP do
    -initiate variable(swapped) = false
    -ITERATE each index
      -IF element 1 > element 2
        -SWAP elements
        -variable(swapped) = true

    -variable(n) = n - 1 since largest element is in final postion after 1 loop

  -BREAK LOOP IF variable(swapped) passes whole iteration without = true

  Output: array sorted
=end

def bubble_sort!(arr)
  n = arr.length
  loop do
    swapped = false
    1.upto(n - 1) do |i|
      if arr[i - 1] >= arr[i]
        arr[i - 1], arr[i] = arr[i], arr[i - 1]
        swapped = true
      end
    end
    n = n - 1
    break unless swapped
  end
end

# REFACTORED
def bubble_sort!(arr)
  n = arr.length
  loop do
    newn = 0
    1.upto(n - 1) do |i|
      if arr[i - 1] >= arr[i]
        arr[i - 1], arr[i] = arr[i], arr[i - 1]
        newn = i
      end
    end
    n = newn
    break if n <= 1
  end
end

# TEST
array = [5, 3]
bubble_sort!(array)
array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)

# Launch School Solution:
def bubble_sort!(array)
  loop do
    swapped = false
    1.upto(array.size - 1) do |index|
      next if array[index - 1] <= array[index]
      array[index - 1], array[index] = array[index], array[index - 1]
      swapped = true
    end

    break unless swapped
  end
  nil
end