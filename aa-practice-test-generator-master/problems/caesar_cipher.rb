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
  new_arr = []
  str.split(' ').each do |word|
    new_arr << word(word,shift)
  end
  new_arr.join(' ')
end

def word(str, shift)
  new_arr = []
  all_letters = ('a'..'z').to_a
  str.chars.each_with_index do |char,i|
    index = all_letters.index(char)
    new_arr << all_letters[(index+shift)%26]
  end
  new_arr.join('')
end
