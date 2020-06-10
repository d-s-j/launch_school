require 'minitest/autorun'
# require_relative 'file_name'

class FileName < Minitest::Test
  def test_
    value = 3
    assert(value.odd?, 'value is not odd')
    # assert(true, value.odd?) # ensure an exact value.
  end
end