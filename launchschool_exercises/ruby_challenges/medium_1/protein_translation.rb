class InvalidCodonError < StandardError; end

class Translation
  AMINO_ACIDS = {
    'Methionine'    => ['AUG'],
    'Phenylalanine' => ['UUU', 'UUC'],
    'Leucine'       => ['UUA', 'UUG'],
    'Serine'        => ['UCU', 'UCC', 'UCA', 'UCG'],
    'Tyrosine'      => ['UAU', 'UAC'],
    'Cysteine'      => ['UGU', 'UGC'],
    'Tryptophan'    => ['UGG'],
    'STOP'          => ['UAA', 'UAG', 'UGA']
  }

  def self.of_codon(codon)
    AMINO_ACIDS.each do |amino, codons|
      return amino if codons.include?(codon)
    end
    nil
  end

  def self.of_rna(rna)
    codons = rna.scan(/.../)
    codons.each_with_object([]) do |codon, aminos|
      raise InvalidCodonError if of_codon(codon).nil?
      return aminos if of_codon(codon) == 'STOP'
      aminos << of_codon(codon)
    end
  end
end

### Refactored:

class InvalidCodonError < StandardError; end

class Translation
  AMINO_ACIDS = {
    "UGU"=>"Cysteine",      "UGC"=>"Cysteine",
    "UUA"=>"Leucine",       "UUG"=>"Leucine",
    "AUG"=>"Methionine",    "UUU"=>"Phenylalanine",
    "UUC"=>"Phenylalanine", "UGA"=>"STOP",
    "UAA"=>"STOP",          "UAG"=>"STOP", 
    "UCA"=>"Serine",        "UCC"=>"Serine",
    "UCU"=>"Serine",        "UCG"=>"Serine",
    "UGG"=>"Tryptophan",    "UAC"=>"Tyrosine",
    "UAU"=>"Tyrosine"
  }

  def self.of_codon(codon)
    AMINO_ACIDS.fetch(codon) { raise InvalidCodonError }
  end

  def self.of_rna(rna)
    codons = rna.scan(/.../)
    codons.each_with_object([]) do |codon, aminos|
      raise InvalidCodonError if of_codon(codon).nil?
      return aminos if of_codon(codon) == 'STOP'
      aminos << of_codon(codon)
    end
  end
end