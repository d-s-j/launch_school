# Counting Sheep (Part 2)
def count_sheep
  5.times do |sheep|
    puts sheep
  end
  10
end

puts count_sheep

# => 0
# => 1
# => 2
# => 3
# => 4
# => 10
# 10 is the implicit return value of count_sheep because it's the last line evaluated.