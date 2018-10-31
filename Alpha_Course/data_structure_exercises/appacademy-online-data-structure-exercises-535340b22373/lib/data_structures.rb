# EASY

# Write a method that returns the range of its argument (an array of integers).
def range(arr)
  # your code goes here
  return arr.max - arr.min
end

# Write a method that returns a boolean indicating whether an array is in sorted
# order. Use the equality operator (==), which returns a boolean indicating
# whether its operands are equal, e.g., 2 == 2 => true, ["cat", "dog"] ==
# ["dog", "cat"] => false
def in_order?(arr)
  # your code goes here
  return arr == arr.sort
end


# MEDIUM

# Write a method that returns the number of vowels in its argument
def num_vowels(str)
  # your code goes here
  vowels_arr = 'aeiou'.split('')
  low_case_str = str.downcase
  count = 0
  low_case_str.each_char do |char|
    count += 1 if vowels_arr.include?(char)
  end
  return count
end

# Write a method that returns its argument with all its vowels removed.
def devowel(str)
  # your code goes here
  vowels_arr = 'AEIOUaeiou'.split('')
  str.each_char do |char|
    if vowels_arr.include?(char)
      str.delete!(char)
    end
  end
  return str
end


# HARD

# Write a method that returns the returns an array of the digits of a
# non-negative integer in descending order and as strings, e.g.,
# descending_digits(4291) #=> ["9", "4", "2", "1"]
def descending_digits(int)
  # your code goes here
  num_str_arr = int.to_s.split('')
  return num_str_arr.sort.reverse
end

# Write a method that returns a boolean indicating whether a string has
# repeating letters. Capital letters count as repeats of lowercase ones, e.g.,
# repeating_letters?("Aa") => true
def repeating_letters?(str)
  # your code goes here
  str.each_char.with_index do |char1, i|
    str.each_char.with_index do |char2, j|
      if j < i
        if char1 == char2.downcase || char1 == char2.upcase
          return true
        end
      end

    end
  end

  return false
end

# Write a method that converts an array of ten integers into a phone number in
# the format "(123) 456-7890".
def to_phone_number(arr)
  # your code goes here
  return "(" + arr[0..2].join('') + ') ' + arr[3..5].join('') + '-' + arr[6..-1].join('')
end

# Write a method that returns the range of a string of comma-separated integers,
# e.g., str_range("4,1,8") #=> 7
def str_range(str)
  # your code goes here
  str_num_arr = str.split(',')  #['4','1','8']
  new_num_arr = []
  str_num_arr.each do |el|
    new_num_arr << el.to_i
  end

  return new_num_arr.max - new_num_arr.min
end


#EXPERT

# Write a method that is functionally equivalent to the rotate(offset) method of
# arrays. offset=1 ensures that the value of offset is 1 if no argument is
# provided. HINT: use the take(num) and drop(num) methods. You won't need much
# code, but the solution is tricky!
def my_rotate(arr, offset=1)
  # your code goes here
  # if offset < 0
  #   # p 'here'
  #   return arr.drop(arr.count - offset.abs % arr.count) + arr.take(arr.count - offset.abs % arr.count)
  # end
  # return arr.drop(offset % arr.count) + arr.take(offset % arr.count)
  split_idx = offset % arr.length
  arr.drop(split_idx) + arr.take(split_idx)
end
