flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.index { |x| x.include?("Be") } # Does not check placement of letters.

# or

flintstones.index { |name| name[0, 2] == "Be" }