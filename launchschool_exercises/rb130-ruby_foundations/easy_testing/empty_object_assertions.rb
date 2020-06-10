require 'minitest/autorun'
# require_relative 'file_name'

class FileNameTest < Minitest::Test
  def setup
    @list = []
  end

  def test_
    assert_empty(@list)
  end
end