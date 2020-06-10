=begin
1
11
121
1331
14641

ARRAY = [[1]]

SIZE - 1 .times DO
  NEW_ARRAY = []
    SIZE .times DO |IDX|
      FIRST = IDX - 1 < 0 ? 0 : ARRAY.last[IDX-1]
      SECOND = ARRAY.last[IDX].nil? ? 0 : ARRAY.last[IDX]
      NEW_ARRAY << FIRST + SECOND
    end
  ARRAY << NEW_ARRAY
END

RETURN ARRAY
=end

class Triangle
  attr_reader :rows

  def initialize(size)
    @rows = create(size)
  end

  def create(size)
    triangle = [[1]]
    (size - 1).times do
      new_row = []
      0.upto(triangle.size) do |idx|
        left = (idx - 1) < 0 ? 0 : triangle.last[idx - 1]
        right = triangle.last[idx].nil? ? 0 : triangle.last[idx]
        new_row << (left + right)
      end
      triangle << new_row
    end

    triangle
  end
end

### Refactored:

class Triangle
  attr_reader :rows
  
  def initialize(size)
    @rows = create(size)
  end

  def create(size)
    triangle = [[1]]
    (size - 1).times do |idx|
      triangle << [0, *triangle[idx], 0].each_cons(2).map { |pair| pair.sum }
    end
    
    triangle
  end
end