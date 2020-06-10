def twice(num)
  str = num.to_s
  mid = str.length/2
  if str[0, mid] == str[mid..-1]
    num
  else
    num * 2
  end
end

twice(37) == 74
twice(44) == 44
twice(334433) == 668866
twice(444) == 888
twice(107) == 214
twice(103103) == 103103
twice(3333) == 3333
twice(7676) == 7676
twice(123_456_789_123_456_789) == 123_456_789_123_456_789
twice(5) == 10