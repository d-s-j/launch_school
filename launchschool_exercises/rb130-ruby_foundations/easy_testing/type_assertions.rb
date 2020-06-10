require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class FileNameTest < Minitest::Test
  def setup
    @value = Numeric.new
  end

  def test_
    assert_instance_of(Numeric, @value)
  end
end