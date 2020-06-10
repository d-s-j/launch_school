class Crypto
  attr_reader :message

  def initialize(message)
    @message = message
  end

  def normalize_plaintext
    message.downcase.scan(/\w/).join
  end

  def size
    Math.sqrt(message.normalize_plaintext.length)
  end
end