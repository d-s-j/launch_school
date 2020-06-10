DEGREE = "\xC2\xB0"

def dms(float)
  degrees = float.to_i % 360
  minutes = (float % 1) * 60
  seconds = (((float % 1) * 60) % 1) * 60
  format(%(#{degrees}#{DEGREE}%02d'%02d"), minutes, seconds)
end

dms(30)
dms(76.73)
dms(254.6)
dms(93.034773)
dms(0)
dms(360)

dms(400)
dms(-40)
dms(-420)
dms(1200)