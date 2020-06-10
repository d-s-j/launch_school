def center_of(str)
  mid = str.length/2
  str.length.odd? ? str[mid] : str[mid - 1, 2]
end

center_of('I love ruby') == 'e'
center_of('Launch School') == ' '
center_of('Launch') == 'un'
center_of('Launchschool') == 'hs'
center_of('x') == 'x'
