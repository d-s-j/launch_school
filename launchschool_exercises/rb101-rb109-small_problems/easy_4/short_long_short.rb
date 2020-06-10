def short_long_short(a, b)
  a.size < b.size ? a + b + a : b + a + b
end