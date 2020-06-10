class School
  attr_reader :students

  def initialize
    @students = Hash.new { |students, grade| students[grade] = [] }
  end

  def add(name, grade)
    students[grade] << name
    students[grade].sort!
  end

  def grade(num)
    students[num]
  end

  def to_h
    students.sort.to_h
  end
end