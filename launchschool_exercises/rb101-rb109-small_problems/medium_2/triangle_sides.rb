=begin
  equilateral: All 3 sides are of equal length
  isosceles:   2 sides are of equal length, while the 3rd is different
  scalene:     All 3 sides are of different length

  Input: 3 integers, representing the lengths of each side of a triangle
  -check valid triangle
    -triangle include 0? OR largest side > sum of all sides?
    -return true or false
  -remove duplicates of any integer
  -count array size: return triangle type based on count

  equilateral = 1
  isosceles = 2
  scalene = 3  

  Output: return a symbol :equilateral, :isosceles, :scalene, or :invalid
=end

def triangle(a, b, c)
  triangle_types = { 1 => :equilateral, 2 => :isosceles, 3 => :scalene }
  triangle = [a,b,c]
  valid_triangle?(triangle) ? triangle_types[triangle.uniq.count] : :invalid
end

def valid_triangle?(triangle)
  return false if triangle.include?(0)
  triangle.sum > 2 * triangle.max
end

# Test
triangle(3, 3, 3) == :equilateral
triangle(3, 3, 1.5) == :isosceles
triangle(3, 4, 5) == :scalene
triangle(0, 3, 3) == :invalid
triangle(3, 1, 1) == :invalid

# Launch School Solution:
def triangle(side1, side2, side3)
  sides = [side1, side2, side3]
  largest_side = sides.max

  case
  when 2 * largest_side > sides.reduce(:+), sides.include?(0)
    :invalid
  when side1 == side2 && side2 == side3
    :equilateral
  when side1 == side2 || side1 == side3 || side2 == side3
    :isosceles
  else
    :scalene
  end
end