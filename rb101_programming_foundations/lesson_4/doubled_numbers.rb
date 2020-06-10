my_numbers = [1, 4, 3, 7, 2, 6]

def double_numbers(numbers)
  doubled_numbers = []
  counter = 0

  loop do
    break if counter == numbers.size

    current_number = numbers[counter]
    doubled_numbers << current_number * 2

    counter += 1
  end

  doubled_numbers
end

# this method mutates the caller
def doubled_numbers(numbers)
  counter = 0

    loop do
      break if counter == numbers.size
      numbers[counter] *= 2
      counter += 1
    end

end