=begin
  -initialize 2 method arguments: string & amount(set default to 1)
  -IF amount greater than or equal to 1
    -PUTS string
    -call method( string, amount - 1 )
  -END IF
=end

def repeat(str, amount = 1)
  if amount >= 1
    puts str
    repeat(str, amount - 1)
  end
end

# Output:
# => 'Hello'
# => 'Hello'
# => 'Hello'