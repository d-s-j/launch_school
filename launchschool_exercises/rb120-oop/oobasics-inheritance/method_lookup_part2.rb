# Using the following code, determine the lookup path used when invoking cat1.color. 
# Only list the classes and modules that Ruby will check when searching for the #color method.

class Animal
end

class Cat < Animal
end

class Bird < Animal
end

cat1 = Cat.new
cat1.color
puts Cat.ancestors # => [Cat, Animal, Object, Kernel, BasicObject]
# 1. Cat
# 2. Animal
# 3. Object
# 4. Kernel
# 5. BasicObject