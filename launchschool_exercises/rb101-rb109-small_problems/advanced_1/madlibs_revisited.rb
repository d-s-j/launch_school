NOUNS = %w(dog cat ball hat).freeze
VERBS =  %w(read shout jump kick).freeze
ADJECTIVES = %w(blue big sweet round).freeze
ADVERBS = %w(quietly quickly joyfully calmly).freeze

File.open("madlibs_text.txt") do |file|
  file.each do |line|
    puts format(line, noun:      NOUNS.sample,
                      verb:      VERBS.sample,
                      adjective: ADJECTIVES.sample,
                      adverb:    ADVERBS.sample)
  end
end

# %{substitution}, #{interpolation}