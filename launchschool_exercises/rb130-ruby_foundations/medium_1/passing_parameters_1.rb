items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  if block_given?
    yield(items)
  else
    puts "#{items.join(', ')}"
  end
  puts "Nice selection of food we have gathered!"
end

gather(items) { |item| puts item.join(', ') + ': $2.50/kg'}