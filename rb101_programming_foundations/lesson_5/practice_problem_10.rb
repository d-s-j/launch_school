[{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}].map do |hsh|
  new_hash = {}
  hsh.each { |k, v| new_hash[k] = v + 1 }
  new_hash
end