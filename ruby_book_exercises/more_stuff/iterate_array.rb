arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

# arr.each { |x| print x, " " }
# arr.each { |x| print x, " " if x > 5 }
# odds = arr.select { |x| x.odd? }
arr.push(11)
arr.unshift(0)
arr.pop
arr.push(3)

arr.uniq!
puts arr