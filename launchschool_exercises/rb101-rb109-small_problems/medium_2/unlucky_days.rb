require 'date'

def friday_13th(year)
  count = 0
  1.upto(12) do |month|
    count += 1 if Date.new(year, month, 13).friday?
  end
  count
end

# or

def friday_13th(year)
  (1..12).to_a.count { |month| Date.new(year, month, 13).friday? }
end

# TEST
friday_13th(2015) == 3
friday_13th(1986) == 1
friday_13th(2019) == 2

# Launch School Solution:
def friday_13th(year)
  unlucky_count = 0
  thirteenth = Date.new(year, 1, 13)
  12.times do
    unlucky_count += 1 if thirteenth.friday?
    thirteenth = thirteenth.next_month
  end
  unlucky_count
end

# Further Exploration: 
def five_friday(year)
  date = Date.new(year)
  five_fridays = 0

  1.upto(12) do |month|
    friday = 0
    until date.month != month
      date += 1
      friday += 1 if date.friday?
    end
    
    five_fridays += 1 if friday == 5
  end

  five_fridays
end