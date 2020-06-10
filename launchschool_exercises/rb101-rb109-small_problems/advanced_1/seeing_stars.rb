=begin
  Write a method that displays an 8-pointed star in an nxn grid, 
  where n is an odd integer that is supplied as an argument to the method. 
  The smallest such star you need to handle is a 7x7 grid.

  Input: Odd integer >= 7

  -initialize variable(space) = space between each stars
    -space = input / 3

  -top of star
    -input/2.times do
      -puts '*' space '*' space '*' .center_by input
      -space -= 1 unless space equals 0
    -end times

  -center of star
   -puts '*' multiplied by input

  -bottom of star
    -input/2.times do
      -puts '*' space '*' space '*' .center_by input
      -space += 1
    -end times

  Output: print star '*'. size based off input
=end

def print_row(space_size, length)
  space = ' ' * space_size
  puts "*#{space}*#{space}*".center(length)
end

def star(size)
  space = size/3

  # top
  (size/2).times do
    print_row(space, size)
    space -= 1 unless space == 0

  end
  # center
  puts '*' * size
  
  # bottom
  (size/2).times do
    print_row(space, size)
    space += 1
  end
end

# TEST
star(7)

*  *  *
 * * *
  ***
*******
  ***
 * * *
*  *  *

# Launch School Solution:
def print_row(grid_size, distance_from_center)
  number_of_spaces = distance_from_center - 1
  spaces = ' ' * number_of_spaces
  output = Array.new(3, '*').join(spaces)
  puts output.center(grid_size)
end

def star(grid_size)
  max_distance = (grid_size - 1) / 2
  max_distance.downto(1) { |distance| print_row(grid_size, distance) }
  puts '*' * grid_size
  1.upto(max_distance)   { |distance| print_row(grid_size, distance) }
end