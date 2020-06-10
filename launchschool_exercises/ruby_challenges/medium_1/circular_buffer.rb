class CircularBuffer
  def initialize(size)
    @buffer = Array.new
    @max_size = size
  end

  def read
    buffer.shift || raise(BufferEmptyException)
  end

  def write(input)
    buffer.size == max_size ? raise(BufferFullException) : write!(input)
  end
  
  def write!(input)
    return unless input
    buffer.shift if buffer.size == @max_size
    buffer << input
  end

  def clear
    self.buffer = Array.new
  end

  private

  attr_accessor :buffer
  attr_reader :max_size
  
  class BufferEmptyException < StandardError; end
  class BufferFullException < StandardError; end
end
