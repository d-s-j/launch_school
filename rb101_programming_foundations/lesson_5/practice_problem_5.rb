munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

age = 0

munsters.each do |_,v|
  if v["gender"] == "male"
    age += v["age"]
  end
end

munsters.each_value do |v|
  age += v["age"] if v["gender"] == "male"
end