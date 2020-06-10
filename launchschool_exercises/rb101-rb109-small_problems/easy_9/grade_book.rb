def get_grade(*grades)
  avg = grades.sum / 3
  if    avg >= 90
    'A'
  elsif avg >= 80
    'B'
  elsif avg >= 70
    'C'
  elsif avg >= 60
    'D'
  else
    'F'
  end
end

# or

def get_grade(*grades)
  avg = grades.sum / 3
  case avg
  when 90..100 then 'A'
  when 80..89  then 'B'
  when 70..79  then 'C'
  when 60..69  then 'D'
  else              'F'
  end
end