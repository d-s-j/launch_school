require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class FileNameTest < Minitest::Test
  def setup
    @value = 3
  end

  def test_
    assert_kind_of(Numeric, @value)
  end
end