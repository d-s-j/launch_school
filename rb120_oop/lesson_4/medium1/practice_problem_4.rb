class Greeting
  def greet(str)
    puts str
  end
end

Hello < Greeting
  def hi
    greet("Hello")
  end
end

Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end
