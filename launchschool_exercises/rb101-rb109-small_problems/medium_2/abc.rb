=begin
  BLOCKS:
  B:O   X:K   D:Q   C:P   N:A
  G:T   R:E   F:S   J:W   H:U
  V:I   L:Y   Z:M

  -Each block can only be used once.
  -Can only use 1 letter from each block.
  
  Input: string 

  CREATE blocks array
  SPLIT string by letters
  CREATE empty array to USED_BLOCKS

  ITERATE through STRING
    ITERATE through BLOCKS
      -IF letter in STRING equals letters in BLOCK
        -Put BLOCK in USED_BLOCKS array
    END
  END
  Remove any duplicates of blocks in USED_BLOCKS array.
  COMPARE original USED_BLOCKS to new USED_BLOCKS array.

  Output: true or false
=end

BLOCKS = %w(BO XK DQ CP NA GT RE FS JW HU VI LY ZM)

def block_word?(str)
  blocks_used = []
  str.upcase.chars.each do |chr|
    BLOCKS.each do |block|
      blocks_used += [block] if block.include?(chr)
    end
  end
  blocks_used == blocks_used.uniq
end

block_word?('BATCH') == true
block_word?('BUTCH') == false
block_word?('jest') == true
