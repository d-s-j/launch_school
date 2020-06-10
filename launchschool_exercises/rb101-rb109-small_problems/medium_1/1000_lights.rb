def flip_switch(switch)
  switch == 1 ? 0 : 1
end

def sentence(result)
  lights_off = result.map.with_index do |light, i|
    (i + 1) if light == nil
  end.compact.map(&:to_s)

  lights_on = result.compact.map(&:to_s)

  puts "Lights #{arr_to_sentence(lights_off)} are now off; #{arr_to_sentence(lights_on)} are on."
end 

def arr_to_sentence(array = nil)
  return array.to_s if array.nil? or array.length <= 1
  array[0..-2].join(", ") + " and " + array[-1]
end

def toggle_lights(n)
  all_lights = Array.new(n, 0)

  1.upto(n) do |round|
    all_lights.map!.with_index do |light, idx|
      if (idx + 1) % round == 0
        flip_switch(light)
      else
        light
      end
    end
  end  

  all_lights.map!.with_index { |light, i| (i + 1) if light == 1 }
  
  sentence(all_lights)
end

=begin
input: integer - represents amount of switches/lights and rounds

-initiate an array - each element represents 1 switch
MAP switches
  LOOP: 'n' times
    -if(index of the element in array + 1) % the current round == zero
      -then turn on/off switch
    -else ignore switch
  END
END 

ITERATE through switches
  -if switch turned on, show the index + 1
  -else ignore
END
-delete switches that are turned off
output: new array, displaying position of switches that were on
=end