class Array
  # Write a new Array method (using monkey-patching) that will return
  # the location of all identical elements. The keys are the
  # duplicated elements, and the values are arrays of their positions,
  # sorted lowest to highest.
  # def dups
  #   positions = Hash.new([])
  #
  #   no_dup = self.select {|el| self.count(el) > 1}.uniq
  #
  #   no_dup.each do |el|
  #     positions[el] = []
  #     arr.each_with_index do |item, index| #array has el, and index
  #       if el == item
  #         positions[el] << index
  #       end
  #     end
  #   end
  #
  #   positions
  # end
  def dups
    hash = Hash.new{|x,y| x[y] = []}

    self.each_with_index do |x, idx|
      hash[x] << idx
    end

    hash.select{|k,v| v.length > 1}
  end
end


class Array
  # Write a new `Array#pair_sum(target)` method that finds all pairs of
  # positions where the elements at those positions sum to the target.

  # NB: ordering matters. I want each of the pairs to be sorted
  # smaller index before bigger index. I want the array of pairs to be
  # sorted "dictionary-wise":
  #   [0, 2] before [1, 2] (smaller first elements come first)
  #   [0, 1] before [0, 2] (then smaller second elements come first)

  def pair_sum(target)
    pairs = []
    self.each_with_index do |el1, i|
      self.each_with_index do |el2, j|
        if el1 + el2 == target && i < j
          pairs << [i, j]
        end
      end
    end
    pairs
  end
end


# Back in the good old days, you used to be able to write a darn near
# uncrackable code by simply taking each letter of a message and incrementing it
# by a fixed number, so "abc" by 2 would look like "cde", wrapping around back
# to "a" when you pass "z".  Write a function, `caesar_cipher(str, shift)` which
# will take a message and an increment amount and outputs the encoded message.
# Assume lowercase and no punctuation. Preserve spaces.
#
# To get an array of letters "a" to "z", you may use `("a".."z").to_a`. To find
# the position of a letter in the array, you may use `Array#find_index`.

def caesar_cipher(str, shift)
  letters = ("a".."z").to_a
  encoded_str = ""

  str.each_char do |char|
    if !letters.include?(char)
      encoded_str += char
    else
      old_idx = letters.find_index(char)
      new_idx = (old_idx + shift) % letters.count
      encoded_str += letters[new_idx]
    end
  end

  encoded_str
end


# Jumble sort takes a string and an alphabet. It returns a copy of the string
# with the letters re-ordered according to their positions in the alphabet. If
# no alphabet is passed in, it defaults to normal alphabetical order (a-z).

# Example:
# jumble_sort("hello") => "ehllo"
# jumble_sort("hello", ['o', 'l', 'h', 'e']) => 'ollhe'

def jumble_sort(str, alphabet = nil)

  alphabet = ('a'..'z').to_a if alphabet == nil

  sorted = ""
  alphabet.each do |alpha|
    str.chars.each do |char|
        sorted += char if alpha == char
    end
  end

  sorted
end

# Write a method that will transpose a rectangular matrix (array of arrays)
def transpose(matrix)
  new_matrix_height = matrix[0].length
  new_matrix_width = matrix.length
  result = [] #Array.new(new_matrix_height, []) #HARD - PASS BY REFERENCE ISSUE
  idx = 0
  new_matrix_height.times do
    result << []
    matrix.each do |el|
      result[idx] << el[idx]
    end
    idx += 1
  end
  result
end


class Array
  def my_inject(accumulator = self.shift, &block)
    i = 0

    while i < length
      accumulator = block.call(accumulator, self[i])
      i += 1
    end
    accumulator
  end
end
