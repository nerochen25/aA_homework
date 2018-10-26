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
  all_letters = ('a'..'z').to_a
  words = str.split(' ')

  new_arr = []
  words.each do |word|
    new_word = ''
    word.each_char.with_index do |char, i|
      index = all_letters.index(char)
      new_word += all_letters[(index+shift)%26].to_s
    end
    new_arr << new_word

  end
  new_arr.join(' ')
end


# Write a method, `digital_root(num)`. It should Sum the digits of a positive
# integer. If it is greater than 10, sum the digits of the resulting number.
# Keep repeating until there is only one digit in the result, called the
# "digital root". **Do not use string conversion within your method.**
#
# You may wish to use a helper function, `digital_root_step(num)` which performs
# one step of the process.

# Example:
# digital_root(4322) => digital_root(11) => (2)

def digital_root(num)
  digits = []
  length = Math.log10(num).to_i + 1
  i = 1
  while i <= length
    digits << (num%10)
    i += 1
    num = num / (10)
  end
  sum = digits.inject(:+)

  digits2 = []
  length2 = Math.log10(sum).to_i + 1
  j = 1
  while j <= length2
    digits2 << (sum%10)
    j += 1
    sum = sum / (10)
  end

  result = digits2.inject(:+)

end

# Jumble sort takes a string and an alphabet. It returns a copy of the string
# with the letters re-ordered according to their positions in the alphabet. If
# no alphabet is passed in, it defaults to normal alphabetical order (a-z).

# Example:
# jumble_sort("hello") => "ehllo"
# jumble_sort("hello", ['o', 'l', 'h', 'e']) => 'ollhe'

def jumble_sort(str, alphabet = ("a".."z").to_a)
  arr = []
  alphabet.each do |char|
    str.chars.each do |char2|
      arr << char2 if char == char2
    end
  end
  arr.join("")
end

class Array
  # Write a method, `Array#two_sum`, that finds all pairs of positions where the
  # elements at those positions sum to zero.

  # NB: ordering matters. I want each of the pairs to be sorted smaller index
  # before bigger index. I want the array of pairs to be sorted
  # "dictionary-wise":
  #   [0, 2] before [1, 2] (smaller first elements come first)
  #   [0, 1] before [0, 2] (then smaller second elements come first)

  def two_sum
    arr = []
    self.each_with_index do |el, i|
      self.each_with_index do |el2, j|
        if j > i && el + el2 == 0
          arr.push([i,j])
        end
      end
    end
    arr
  end
end

class String
  # Returns an array of all the subwords of the string that appear in the
  # dictionary argument. The method does NOT return any duplicates.

  def real_words_in_string(dictionary)
    storage = []
    length = self.length
    i = 1
    new_arr = []
    while i < length
      self.split('').each_cons(i) do |sub|
        storage << sub.join('')
      end
      i += 1
    end
    dictionary.each do |word|
      if storage.include?(word)
        new_arr << word
      end
    end
    new_arr
  end
end

# Write a method that returns the factors of a number in ascending order.

def factors(num)
  arr = []
  (1..num).each do |int|
    arr << int if num % int == 0
  end
  arr.sort
end
