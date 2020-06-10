def double_consonants(str)
  str.chars.map do |chr| 
    if chr =~ (/[a-z&&[^aeiou]]/i)
      chr * 2
    else
      chr
    end
  end.join
end

double_consonants('String') == "SSttrrinngg"
double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
double_consonants("July 4th") == "JJullyy 4tthh"
double_consonants('') == ""