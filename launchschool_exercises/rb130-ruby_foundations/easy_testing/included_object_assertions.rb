require 'minitest/autorun'
# require_relative 'file_name'

class FileNameTest < Minitest::Test
  def setup
    @list = ['xyz']
  end

  def test_
    assert_includes(@list, 'xyz')
  end
end