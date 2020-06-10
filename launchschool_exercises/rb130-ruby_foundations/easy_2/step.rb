def step(a, b, c)
  a.upto(b) do |x|
    yield(x) if (x % c) == 1 || x == a
  end
end

step(1, 10, 3) { |value| puts "value = #{value}" }
# value = 1
# value = 4
# value = 7
# value = 10
# => 1..10

# Launchschool Solution:

def step(start_point, end_point, increment)
  current_value = start_point
  loop do
    yield(current_value)
    break if current_value + increment > end_point
    current_value += increment
  end
  current_value
end

# Refactor:

def step(start_point, end_point, increment)
  until start_point > end_point
    yield(start_point)
    start_point += increment
  end
end
