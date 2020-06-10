class Clock
  attr_accessor :hour, :minute

  def self.at(hr, min=0)
    clock = Clock.new
    clock.hour = hr
    clock.minute = min
    clock
  end

  def +(min)
    self.minute += min%60
    self.hour += min/60
    self.hour %= 24
    self.minute %= 60
    self
  end

  def -(min)
    self + -min
  end

  def ==(other)
    hour == other.hour && minute == other.minute
  end

  def to_s
    format("%02d:%02d", hour, minute)
  end
end