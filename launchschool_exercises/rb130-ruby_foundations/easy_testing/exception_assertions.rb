require 'minitest/autorun'
# require_relative 'file_name'
class NoExperienceError < StandardError
end

class Employee
  def hire
    raise NoExperienceError
  end
end

class FileNameTest < Minitest::Test
  def setup
    @employee = Employee.new
  end

  def test_
    assert_raises(NoExperienceError) { @employee.hire }
  end
end