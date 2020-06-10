=begin
  Input: string container '(' and ')'
  -initiate a variable = 0, 'checker'
  -iterate through string characters
    -if character == '(' -starting bracket
      - add 1 to 'checker'
    -if character == ')' -closing bracket
      - minus 1 from 'checker'
    -if 'checker' ever reaches below 0
      - return false
  -end
  -'checker' == 0, return true or false?
  Output: boolean stating whether parentheses in string are balanced.
=end

def balanced?(str)
  parentheses = 0
  str.chars.each do |c|
    parentheses += 1 if c == "("
    parentheses -= 1 if c == ")"
    return false if parentheses < 0
  end

  parentheses.zero?
end

# If string includes '( )' '[ ]' '{ }'
def balanced?(str)
  round = 0
  square = 0
  curly = 0
  str.chars.each do |c|
    round += 1 if c == "("
    round -= 1 if c == ")"
    square += 1 if c == "["
    square -= 1 if c == "]"
    curly += 1 if c == "{"
    curly -= 1 if c == "}"
    return false if round < 0 || square < 0 || curly < 0
  end

  round.zero? && square.zero? && curly.zero?
end

# or

def balanced?(str)
  str.gsub!(/[a-z]/, '')
  while str.gsub!(/(\(\)|\[\]|\{\})/, '') do; end
  str.empty?
end

balanced?('What (is) this?') == true
balanced?('What is) this?') == false
balanced?('What (is this?') == false
balanced?('((What) (is this))?') == true
balanced?('((What)) (is this))?') == false
balanced?('Hey!') == true
balanced?(')Hey!(') == false
balanced?('What ((is))) up(') == false