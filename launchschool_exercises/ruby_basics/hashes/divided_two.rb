# -Divided by Two-
numbers = {
  high:   100,
  medium: 50,
  low:    10
}

half_numbers = numbers.map { |k, v| v/2 }
p half_numbers

# Enumerable#map can accept two block parameters instead of one, 
# to account for both the key and the value.