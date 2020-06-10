# CoursesRB101 Programming FoundationsLesson 3 > Practice ProblemsPractice Problems > Easy 1
# Question 8: Make this into an un-nested array.

flintstones = ["Fred", "Wilma"]
flintstones << ["Barney", "Betty"]
flintstones << ["BamBam", "Pebbles"]

# => ["Fred", "Wilma", ["Barney", "Betty"], ["BamBam", "Pebbles"]]

flintstones.flatten!