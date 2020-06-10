def triangle(n)
  stars = 1
  n.times do
    puts ("*" * stars).rjust(n)
    stars += 1
  end
end

# upside down

def triangle(n)
  stars = n
  n.times do
    puts ("*" * stars).rjust(n)
    stars -= 1
  end
end

# choose a corner

def triangle(n, corner)
  # topleft = :tl, topright = :tr, bottomleft = :bl, bottomright = :br
  if corner == :tl
    stars = n
    n.times { puts ("*" * stars).ljust(n); stars -= 1 }
  elsif corner == :tr
    stars = n
    n.times { puts ("*" * stars).rjust(n); stars -= 1 }
  elsif corner == :bl
    stars = 1
    n.times { puts ("*" * stars).ljust(n); stars += 1 }
  elsif corner == :br
    stars = 1
    n.times { puts ("*" * stars).rjust(n); stars += 1 }
  end
end