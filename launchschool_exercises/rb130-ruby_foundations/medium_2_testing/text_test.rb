require 'minitest/autorun'
require 'minitest/reporters'
require_relative 'text'
Minitest::Reporters.use!

class TextTest < Minitest::Test
  def setup
    @file = File.open('./sample_text.txt', 'r')
    @text = Text.new(@file.read)
  end

  def test_swap
    actual_text = @text.swap('a', 'e')
    expected_text = File.read('sample_text.txt').gsub('a', 'e')
    assert_equal(expected_text, actual_text)
  end

  def test_word_count
    assert_equal(72, @text.word_count)
  end

  def teardown
    @file.close
    puts "File has been closed: #{@file.closed?}"
  end
end