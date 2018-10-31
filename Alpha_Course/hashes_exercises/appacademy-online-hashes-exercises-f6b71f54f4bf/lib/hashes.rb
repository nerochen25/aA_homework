# EASY

# Define a method that, given a sentence, returns a hash of each of the words as
# keys with their lengths as values. Assume the argument lacks punctuation.
def word_lengths(str)
  new_hash = {}
  str.split(' ').each {|word| new_hash[word.to_s] = word.length }
  new_hash
end

# Define a method that, given a hash with integers as values, returns the key
# with the largest value.
def greatest_key_by_val(hash)
  biggest_value = hash.values.max
  hash.key(biggest_value)
end

# Define a method that accepts two hashes as arguments: an older inventory and a
# newer one. The method should update keys in the older inventory with values
# from the newer one as well as add new key-value pairs to the older inventory.
# The method should return the older inventory as a result. march = {rubies: 10,
# emeralds: 14, diamonds: 2} april = {emeralds: 27, moonstones: 5}
# update_inventory(march, april) => {rubies: 10, emeralds: 27, diamonds: 2,
# moonstones: 5}
def update_inventory(older, newer)
  newer.each do |k,v|
    unless older.has_key?(k) #adding new k-v pair to older
      older[k] = v
    else
      older[k] = v
    end
  end
  older
end

# Define a method that, given a word, returns a hash with the letters in the
# word as keys and the frequencies of the letters as values.
def letter_counts(word)
  hash = {}
  word.split('').each do |letter|
    hash[letter] = word.count(letter)
  end
  hash
end

# MEDIUM

# Define a method that, given an array, returns that array without duplicates.
# Use a hash! Don't use the uniq method.
def my_uniq(arr)
  hash = {}
  arr.each do |el|
    hash[el] = arr.count(el) unless hash.has_key?(el)
  end
  hash.keys
end

# Define a method that, given an array of numbers, returns a hash with "even"
# and "odd" as keys and the frequency of each parity as values.
def evens_and_odds(numbers)
  hash = {}
  evens = numbers.select {|int| int.even?}
  odds = numbers.select {|int| int.odd?}
  hash[:even] = evens.count
  hash[:odd] = odds.count
  hash
end

# Define a method that, given a string, returns the most common vowel. Do
# not worry about ordering in the case of a tie. Assume all letters are
# lower case.
def most_common_vowel(string)
  hash = {'a'=>0,'e'=>0,'i'=>0,'o'=>0,'u'=>0}
  # vowels = "aeiou".split('')
  string.each_char do |char|
    if hash.has_key?(char)
      hash[char] +=1
    end
  end
  max_val = hash.values.max
  return hash.key(max_val)
end

# HARD

# Define a method that, given a hash with keys as student names and values as
# their birthday months (numerically, e.g., 1 corresponds to January), returns
# every combination of students whose birthdays fall in the second half of the
# year (months 7-12). students_with_birthdays = { "Asher" => 6, "Bertie" => 11,
# "Dottie" => 8, "Warren" => 9 }
# fall_and_winter_birthdays(students_with_birthdays) => [ ["Bertie", "Dottie"],
# ["Bertie", "Warren"], ["Dottie", "Warren"] ]
def fall_and_winter_birthdays(students)
  second_half = students.select {|k,v| v > 6}
  selected_students = second_half.keys
  result = []
  selected_students.each_with_index do |name, i|
    selected_students.each_with_index do |name1, j|
      if j > i
        result << [name, name1]
      end
    end
  end
  result
end

# Define a method that, given an array of specimens, returns the biodiversity
# index as defined by the following formula: number_of_species**2 *
# smallest_population_size / largest_population_size biodiversity_index(["cat",
# "cat", "cat"]) => 1 biodiversity_index(["cat", "leopard-spotted ferret",
# "dog"]) => 9
def biodiversity_index(specimens)
  number_of_species = specimens.uniq.count
  hash = {}
  specimens.uniq.each do |species|
    hash[species] = specimens.count(species)
  end
  smallest_population_size = hash.values.min
  largest_population_size = hash.values.max
  result = (number_of_species**2) * smallest_population_size / largest_population_size
  result
end

# Define a method that, given the string of a respectable business sign, returns
# a boolean indicating whether pranksters can make a given vandalized string
# using the available letters. Ignore capitalization and punctuation.
# can_tweak_sign("We're having a yellow ferret sale for a good cause over at the
# pet shop!", "Leopard ferrets forever yo") => true
# def can_tweak_sign?(normal_sign, vandalized_sign)
#   # vandalized_sign.downcase.each_char do |char|
#   #   unless normal_sign.include?(char)
#   #     return false
#   #   end
#   # end
#   vandalized_sign.downcase.split(' ').each do |word|
#     normal_sign.downcase.split(' ').each do |word1|
#        if word.split('').sort == word1.split('').sort
#         return true
#       end
#     end
#   end
#   return false
# end
#
# def character_count(str)
#   # str.count
# end

def can_tweak_sign?(normal_sign, vandalized_sign)
  normal_count = character_count(normal_sign)
  vandalized_count = character_count(vandalized_sign)

  vandalized_count.all? do |character, count|
    normal_count[character.downcase] >= count
  end
end

def character_count(str)
  count = Hash.new(0)

  str.each_char do |char|
    next if char == " "
    count[char.downcase] += 1
  end

  count
end
