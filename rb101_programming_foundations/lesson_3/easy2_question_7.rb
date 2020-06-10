# RB101 Programming Foundations > Lesson 3: Practice Problems > Easy 2
# Question 7: How can we add multiple items to our array? (Dino and Hoppy)

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones << "Dino" << "Hoppy"
flintstones.push("Dino").push("Hoppy")
flintstones.concat(%w(Dino Hoppy))