# class BeerSong
#   def lyrics
#     verses(99, 0)
#   end

#   def verse(n)
#     if n > 2
#       "#{n} bottles of beer on the wall, #{n} bottles of beer.\n" \
#       "Take one down and pass it around, #{n-1} bottles of beer on the wall.\n"
#     elsif n == 2
#       "2 bottles of beer on the wall, 2 bottles of beer.\n" \
#       "Take one down and pass it around, 1 bottle of beer on the wall.\n" \
#     elsif n == 1
#       "1 bottle of beer on the wall, 1 bottle of beer.\n" \
#       "Take it down and pass it around, no more bottles of beer on the wall.\n" \
#     else
#       "No more bottles of beer on the wall, no more bottles of beer.\n" \
#       "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
#     end
#   end

#   def verses(v1, v2)
#     v1.downto(v2).with_object([]) do |v, arr|
#       arr << verse(v)
#     end.join("\n")
#   end
# end

### Refactored:

class BeerSong
  VERSE_ZERO = "No more bottles of beer on the wall, no more bottles of beer.\n" \
               "Go to the store and buy some more, 99 bottles of beer on the wall.\n"

  VERSE_ONE = "1 bottle of beer on the wall, 1 bottle of beer.\n" \
              "Take it down and pass it around, no more bottles of beer on the wall.\n" \

  VERSE_TWO = "2 bottles of beer on the wall, 2 bottles of beer.\n" \
              "Take one down and pass it around, 1 bottle of beer on the wall.\n" \

  def verse(v)
    verses_hsh = {0 => VERSE_ZERO, 1 => VERSE_ONE, 2 => VERSE_TWO}
    verses_hsh.default = default_verse(v)
    verses_hsh[v]
  end

  def verses(v1, v2)
    v1.downto(v2).with_object([]) do |v, arr|
      arr << verse(v)
    end.join("\n")
  end

  def lyrics
    verses(99, 0)
  end

  def default_verse(n)
    "#{n} bottles of beer on the wall, #{n} bottles of beer.\n" \
    "Take one down and pass it around, #{n-1} bottles of beer on the wall.\n"
  end
end