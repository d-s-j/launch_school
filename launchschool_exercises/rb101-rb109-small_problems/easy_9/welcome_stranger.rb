def greetings(name, status)
  n = name.join(' ')
  s = status[:title] + ' ' + status[:occupation]
  "Hello, #{n}! Nice to have a #{s} around."
end

greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
=> Hello, John Q Doe! Nice to have a Master Plumber around.