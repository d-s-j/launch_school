# Counting Sheep (Part 1)
def count_sheep
  5.times do |sheep|
    puts sheep
  end
end

puts count_sheep

# => 0
# => 1
# => 2
# => 3
# => 4
# => 5
# The method will print the integers 0 through 4, 
# -puts- the return value of count_sheep, it will print 5, 
# The return value of a call to -puts- is nil, so it will finally return nil.