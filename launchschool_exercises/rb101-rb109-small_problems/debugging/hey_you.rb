=begin
  String#upcase! is a destructive method, so why does this code print...
  HEY you instead of HEY YOU? Modify the code so that it produces the expected output.
=end

def shout_out_to(name)
  name.chars.each { |c| c.upcase! }

  puts 'HEY ' + name
end

shout_out_to('you') # expected: 'HEY YOU'

# Solution:
def shout_out_to(name)
  name.upcase!

  puts 'HEY ' + name
end

# or

def shout_out_to(name)
  puts 'HEY ' + name.upcase
end