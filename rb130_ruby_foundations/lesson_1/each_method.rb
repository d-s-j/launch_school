def each(array)
  counter = 0

  while counter < array.size
    yield(array[counter])
    counter += 1
  end

  array
end

a = [1, 2, 3, 4, 5]
each(a) { |num| puts num }
