def times(number)
  counter = 0
  while counter < number do
    yield(counter) # executing block of code with argument `counter`
    counter += 1
  end

  number
end

times(5) { |num| puts num }