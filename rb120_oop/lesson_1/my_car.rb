module OffRoadable
  def off_road
    puts "I'm offroading!"
  end
end

module Towable
  def can_tow?(pounds)
    pounds < 2000 ? true : false
  end
end

class Vehicle
  attr_accessor :color
  attr_reader :year, :model

  @@number_of_vehicles = 0

  def initialize(year, model, color)
    @year = year
    @model = model
    @color = color
    @current_speed = 0
    @@number_of_vehicles += 1
  end

  def self.total_number_of_vehicles
    puts "You have created #{@@number_of_vehicles} vehicles."
  end

  def self.gas_mileage(gallons, miles)
    puts "#{miles / gallons} miles per gallon of gas."
  end

  def spray_paint(color)
    self.color = color
    puts "You spray paint your car the color #{color}."
  end

  def speed_up(number)
    @current_speed += number
    puts "You push the gas and accelerate #{number} mph."
  end

  def brake(number)
    @current_speed -= number
    puts "You push the brake and decelerate #{number} mph."
  end

  def current_speed
    puts "You are now going #{@current_speed} mph."
  end

  def shut_down
    @current_speed = 0
    puts "Let's park this bad boy!"
  end

  def age
    puts "Your #{model} is #{calculate_age} years old."
  end

  private

  def calculate_age
    Time.now.year - year
  end
end

class MyCar < Vehicle
  NUMBER_OF_DOORS = 4

  def to_s
    "This car is a #{color}, #{year}, #{model}."
  end
end

class MyTruck < Vehicle
  include OffRoadable, Towable

  NUMBER_OF_DOORS = 2

  def to_s
    "This truck is a #{color}, #{year}, #{model}."
  end
end


truck = MyTruck.new(2000, 'Toyota Tunda', 'Black')
car = MyCar.new(1992, 'Honda Civic', 'Red')

truck.age