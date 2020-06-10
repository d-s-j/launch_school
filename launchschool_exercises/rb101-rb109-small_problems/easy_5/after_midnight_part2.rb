def after_midnight(time)
  hours, minutes = time.split(':').map(&:to_i)
  ((hours * 60) + minutes) % 1440
end

def before_midnight(time)
  hours, minutes = time.split(':').map(&:to_i)
  (1440 - ((hours * 60) + minutes)) % 1440
end