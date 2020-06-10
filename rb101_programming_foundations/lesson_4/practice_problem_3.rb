ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

ages.delete_if { |k, v| v >= 100 }

# or

ages.keep_if { |_, age| age < 100 }

# or

ages.select! { |_, age| age < 100 }