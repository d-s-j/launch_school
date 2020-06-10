def triangle(n)
  stars = 1
  (n/2).times do
    puts ("*" * stars).center(n)
    stars += 2
  end
end

def upside_down_triangle(n)
  stars = n
  (n/2).times do
    puts ("*" * stars).center(n)
    stars -= 2
  end
  puts ("*").center(n)
end

def diamond(n)
  triangle(n)
  upside_down_triangle(n)
end

diamond(9)
#     *
#    ***
#   *****
#  *******
# *********
#  *******
#   *****
#    ***
#     *

# Further Exploration: prints only the outline of the diamond

def triangle(n)
  stars = 1
  puts ("*").center(n)
  (n/2).times do
    puts ("*" + (" " * stars) + "*").center(n)
    stars += 2
  end
end

def upside_down_triangle(n)
  stars = n-2
  ((n/2)-1).times do
    stars -= 2
    puts ("*" + (" " * stars) + "*").center(n)
  end
  puts ("*").center(n)
end

def hollow_diamond(n)
  triangle(n)
  upside_down_triangle(n)
end

diamond(5)
#   *
#  * *
# *   *
#  * *
#   *