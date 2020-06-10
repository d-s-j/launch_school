# RB101 Programming Foundations > Lesson 3: Practice Problems > Easy 2
# Questin 1: see if "Spot" is present.
# Bonus: What are two other hash methods that would work just as well for this solution?

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
p ages.key?("Spot")
p ages.include?("Spot")
p ages.member?("Spot")