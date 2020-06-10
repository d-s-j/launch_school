def staggered_case(str, count_non_alpha = false)
  case_switch = false

  if count_non_alpha
    str.chars.each_with_index.map do |letter, index|
      index.even? ? letter.upcase : letter.downcase
    end.join
  else
    str.chars.each do |chr|
      if ('a'..'z').cover?(chr.downcase)
        case_switch ? chr.downcase! : chr.upcase!
        case_switch = !case_switch
      end
    end.join('')
  end
end
