def century(year)
  century = year.ceil(-2)/100

  ordinal = case century % 100
  when 11, 12, 13 then 'th'
  else
    case century % 10
    when 1 then 'st'
    when 2 then 'nd'
    when 3 then 'rd'
    else 'th'
    end
  end
  
  puts "#{century}#{ordinal}"
end