def fizzbuzz(start_num, end_num)
  result = []
  start_num.upto(end_num) do |num|
    case
    when num % 3 == 0 && num % 5 == 0
      result << 'FizzBuzz'
    when num % 5 == 0
      result << 'Buzz'
    when num % 3 == 0
      result << 'Fizz'
    else
      result << num
    end
  end
  result.join(', ')
end

fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz