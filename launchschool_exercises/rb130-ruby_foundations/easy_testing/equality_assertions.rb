require 'minitest/autorun'
# require_relative 'file_name'

class FileNameTest < Minitest::Test
  def test_
    value = 'XYZ'
    assert_equal('xyz', value.downcase)
  end
end