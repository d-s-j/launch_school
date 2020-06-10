require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class FileNameTest < Minitest::Test
  def setup
    @list = []
  end

  def test_
    refute_includes(@list, 'xyz')
  end
end