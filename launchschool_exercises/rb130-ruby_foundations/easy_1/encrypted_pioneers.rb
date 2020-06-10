def rot_13(input)
  alphabet = ('a'..'z').to_a
  result = ''

  input.each_char do |chr|
    if !alphabet.include?(chr.downcase)
      result += chr
    else
      idx = alphabet.index(chr.downcase) + 13
      idx -= 26 if idx > 25
      letter = alphabet[idx]
      result += chr.upcase == chr ? letter.upcase : letter
    end
  end

  result
end

p rot_13('Nqn Ybirynpr')
p rot_13('Tenpr Ubccre')
p rot_13('Nqryr Tbyqfgvar')
p rot_13('Nyna Ghevat')
p rot_13('Puneyrf Onoontr')
p rot_13('Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv')
p rot_13('Wbua Ngnanfbss')
p rot_13('Ybvf Unvog')
p rot_13('Pynhqr Funaaba')
p rot_13('Fgrir Wbof')
p rot_13('Ovyy Tngrf')
p rot_13('Gvz Orearef-Yrr')
p rot_13('Fgrir Jbmavnx')
p rot_13('Xbaenq Mhfr')
p rot_13('Fve Nagbal Ubner')
p rot_13('Zneiva Zvafxl')
p rot_13('Lhxvuveb Zngfhzbgb')
p rot_13('Unllvz Fybavzfxv')
p rot_13('Tregehqr Oynapu')

# LaunchSchool Solution:

def rot13(encrypted_text)
  encrypted_text.each_char.reduce('') do |result, encrypted_char|
    result + decipher_character(encrypted_char)
  end
end

def decipher_character(encrypted_char)
  case encrypted_char
  when 'a'..'m', 'A'..'M' then (encrypted_char.ord + 13).chr
  when 'n'..'z', 'N'..'Z' then (encrypted_char.ord - 13).chr
  else                         encrypted_char
  end
end