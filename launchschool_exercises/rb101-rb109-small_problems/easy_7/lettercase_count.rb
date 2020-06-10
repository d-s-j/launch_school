def letter_case_count(str)
  case_count = { lowercase: 0, uppercase: 0, neither: 0 }

  str.each_char do |letter|
    if ('a'..'z').include?(letter)
      case_count[:lowercase] += 1
    elsif ('A'..'Z').include?(letter)
      case_count[:uppercase] += 1
    else
      case_count[:neither] += 1
    end
  end

  case_count
end