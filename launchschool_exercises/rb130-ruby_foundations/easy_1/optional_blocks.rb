def compute
  block_given? ? yield : 'Does not compute.'  
end

p compute { 5 + 3 } == 8
p compute { 'a' + 'b' } == 'ab'
p compute == 'Does not compute.'

def compute2(x)
  block_given? ? yield(x) : 'Does not compute.'
end

p compute2(1) { 1 + 1 } == 2
p compute2(5) { |x| x + 1 } == 6
p compute2(2) == 'Does not compute.'