def reverse!(list)
  temp_list = []
  list.length.times { temp_list << list.pop }
  temp_list.length.times { list << temp_list.shift }
  list
end
