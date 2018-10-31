# Write a recursive method that takes in a string to search and a key string.
# Return true if the string contains all of the characters in the key
# in the same order that they appear in the key.
#
# string_include_key?("cadbpc", "abc") => true
# string_include_key("cba", "abc") => false
def string_include_key?(string, key)
  return true if key.length == 0

  next_char = key.chars.first
  key_index = string.index(next_char)

  return false if key_index.nil?
  string_include_key?(string[key_index+1..-1], key[1..-1])
end

#use return true if key.length == 0 as base case
#since we are cuting key and string from front until
#key.length is 0.
#Next step is to store key's first letter each round,
#then get its index from the string.
#if key's letter's index == nil (doesnt exist), return false.
#if didnt return false, go to the next round
#by cutting string from where we found key's first letter
#and also cutting key from front one by one.


end
