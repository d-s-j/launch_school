

def generate_UUID
  uuid = []
  characters = ('a'..'z').to_a + (0..9).to_a

  loop do
    uuid << characters.sample
    uuid << '-' if uuid.length == 8
    uuid << '-' if uuid.length == 13
    uuid << '-' if uuid.length == 18
    uuid << '-' if uuid.length == 23
    break if uuid.length == 36
  end  

  uuid.join
end

# or

def generate_UUID
  characters = []
  (0..9).each { |digit| characters << digit.to_s }
  ('a'..'f').each { |digit| characters << digit }

  uuid = ""
  sections = [8, 4, 4, 4, 12]
  sections.each_with_index do |section, index|
    section.times { uuid += characters.sample }
    uuid += '-' unless index >= sections.size - 1
  end

  uuid
end