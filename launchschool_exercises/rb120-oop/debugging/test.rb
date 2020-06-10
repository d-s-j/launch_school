class Hello
  OPTIONS = 'hi'
  def to_s
    self::OPTIONS
  end
end

man = Hello.new

puts man.to_s

