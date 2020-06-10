=begin
  input: positive integer
  output: return a string of alternating 1s and 0s, starting with 1
          length of string == input integer

  DEF stringy( number, alternate = false, result = '' )
    UNTIL result.size == number do
      alternate == true ? result += '0' : result += '1'
      stringy(number, !alternate, result)
    END UNTIL

    return result
  END DEF
=end

def stringy(num, alternate=false, result='')
  until result.size == num
    alternate ? result += '0' : result += '1'
    stringy(num, alternate=!alternate, result)
  end

  result
end

# Examples:

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'