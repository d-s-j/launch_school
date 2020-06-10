# class DNA
#   def initialize(strand)
#     @original_strand = strand
#   end

#   def hamming_distance(strand)
#     distance = 0
#     strand.chars.each_index do |index|
#       break if @original_strand[index].nil? || strand[index].nil?
#       distance += 1 if @original_strand[index] != strand[index]
#     end

#     distance
#   end
# end

### Refactored:

class DNA
  def initialize(strand)
    @strand = strand
  end

  def hamming_distance(other_strand)
    distance = 0
    short, long = [@strand, other_strand].sort_by(&:size)
    short.size.times do |index|
      distance += 1 if short[index] != long[index]
    end

    distance
  end
end