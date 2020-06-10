def show_multiplicative_average(num)
  average = num.inject(:*) / num.length.to_f
  format("%.3f", average)
end