require 'byebug'

# EASY

# Define a method that returns the sum of all the elements in its argument (an
# array of numbers).
def array_sum(arr)
  sum = 0
  arr.each {|el| sum += el}
  return sum
end

# Define a method that returns a boolean indicating whether substring is a
# substring of each string in the long_strings array.
# Hint: you may want a sub_tring? helper method
def in_all_strings?(long_strings, substring)
  long_strings.all? {|sub| sub.include?(substring)}
end

# Define a method that accepts a string of lower case words (no punctuation) and
# returns an array of letters that occur more than once, sorted alphabetically.
def non_unique_letters(string)
  new_arr = []
  string = string.split(' ').join('')
  string.each_char do |char|
    if string.count(char) > 1
      new_arr << char unless new_arr.include?(char)
    end
  end
  return new_arr.sort

end

# Define a method that returns an array of the longest two words (in order) in
# the method's argument. Ignore punctuation!
def longest_two_words(string)
  words = string.split(' ')
  longest_two = words.sort_by{|el| el.length}.reverse[0..1]
  result = []
  words.each do |word|
    if longest_two.include?(word)
      result << word
    end
  end
  return result
end

# MEDIUM

# Define a method that takes a string of lower-case letters and returns an array
# of all the letters that do not occur in the method's argument.
def missing_letters(string)
  all_letters = []
  ('a'..'z').each do |char|
    all_letters << char
  end

  arr = all_letters - string.split('')
end

# Define a method that accepts two years and returns an array of the years
# within that range (inclusive) that have no repeated digits. Hint: helper
# method?
def no_repeat_years(first_yr, last_yr)
  new_arr = []
  (first_yr..last_yr).each do |year|
    if not_repeat_year?(year)
      new_arr << year
    end
  end
  return new_arr
end

def not_repeat_year?(year)
  arr = year.to_s.split('')
  if arr.length == arr.uniq.length
    return true
  else
    return false
  end
end

# HARD

# Define a method that, given an array of songs at the top of the charts,
# returns the songs that only stayed on the chart for a week at a time. Each
# element corresponds to a song at the top of the charts for one particular
# week. Songs CAN reappear on the chart, but if they don't appear in consecutive
# weeks, they're "one-week wonders." Suggested strategy: find the songs that
# appear multiple times in a row and remove them. You may wish to write a helper
# method no_repeats?
def one_week_wonders(songs)
  repeated_elements = []
  songs.each_with_index do |song, i|
    if song == songs[i+1] && i != songs.length - 1
      repeated_elements << song
    end
  end
  uniq_songs = songs.uniq
  return uniq_songs.select {|song| !repeated_elements.include?(song)}
end

def no_repeats?(song_name, songs)

end

# Define a method that, given a string of words, returns the word that has the
# letter "c" closest to the end of it. If there's a tie, return the earlier
# word. Ignore punctuation. If there's no "c", return an empty string. You may
# wish to write the helper methods c_distance and remove_punctuation.

def for_cs_sake(string)
  # smallest gap wins
  words = string.split(' ')


  c_word = ''
  arr = []
  words.each_with_index do |word, i|
    if word.include?('c') && c_distance(word.to_s) <= c_distance(words[i+1].to_s) && i != words.length - 1
      c_word = word
      arr << c_word
    end
  end
  if arr.length == 0
    return []
  else
    return arr.first.to_s.downcase.gsub(/[^a-z ]/, '')
  end
end

def c_distance(word)
  # turn word into a word
  # return word.length - latest c's index
  return word.length unless word.downcase.include?('c')
  latest_c_index = 0
  modified_word = word.to_s.downcase.gsub(/[^a-z ]/, '')

  word.each_char.with_index do |char, i|
    if char == 'c'
      latest_c_index = i
    else
      next
    end
  end
  return modified_word.length - (latest_c_index + 1)
end

# Define a method that, given an array of numbers, returns a nested array of
# two-element arrays that each contain the start and end indices of whenever a
# number appears multiple times in a row. repeated_number_ranges([1, 1, 2]) =>
# [[0, 1]] repeated_number_ranges([1, 2, 3, 3, 4, 4, 4]) => [[2, 3], [4, 6]]

def repeated_number_ranges(numbers)
  ranges = []
  start_index = false

  # start walking
  # set the start_index when we're at the beginning of a range
  # when we reach the end of a range, add the range to the list and reset the start_index

  numbers.each_with_index do |el, idx|
    next_el = numbers[idx + 1]
    if el == next_el
      start_index = idx if !start_index #i.e., reset the start_index if it's nil
    elsif start_index # i.e., if the start index isn't nil (the numbers switched)
      ranges.push([start_index, idx])
      start_index = false # reset the start_index to nil so we can capture more ranges
    end
  end

  ranges
end
