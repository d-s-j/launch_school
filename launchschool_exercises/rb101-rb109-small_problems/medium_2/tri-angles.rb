=begin
  right:  One angle of the triangle is a right angle (90 degrees)
  acute:  All 3 angles of the triangle are less than 90 degrees
  obtuse: One angle is greater than 90 degrees.

  Input: 3 integers representing 3 angles of a triangle.
    -check valid triangle
      -return invalid if angles sum is not equal to 180
    -check biggest angle
      -if == 90 - right triangle
      -if > 90 -  obtuse
      -else -     acute
  Output: :right, :acute, :obtuse, or :invalid depending on type of triangle
=end

def triangle(a, b, c)
  angles = [a, b, c]
  case 
  when angles.sum != 180 || angles.include?(0) then :invalid
  when angles.max == 90                        then :right
  when angles.max > 90                         then :obtuse
  else                                              :acute
  end
end


# TEST
triangle(60, 70, 50) == :acute
triangle(30, 90, 60) == :right
triangle(120, 50, 10) == :obtuse
triangle(0, 90, 90) == :invalid
triangle(50, 50, 50) == :invalid