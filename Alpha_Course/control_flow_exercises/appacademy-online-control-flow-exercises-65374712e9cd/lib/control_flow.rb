# EASY

# Return the argument with all its lowercase characters removed.
def destructive_uppercase(str)
  str_arr = str.split('')
  new_arr = str_arr.select {|el| el == el.upcase}
  return new_arr.join
end

# Return the middle character of a string. Return the middle two characters if
# the word is of even length, e.g. middle_substring("middle") => "dd",
# middle_substring("mid") => "i"
def middle_substring(str)
  return str[str.length/2] if str.length.odd?
  return str[str.length/2-1..str.length/2] if str.length.even?
end

# Return the number of vowels in a string.
VOWELS = %w(a e i o u)
def num_vowels(str)
  count = 0
  str.each_char do |char|
    if VOWELS.include?(char.downcase)
      count += 1
    end
  end
  return count
end

# Return the factoral of the argument (num). A number's factorial is the product
# of all whole numbers between 1 and the number itself. Assume the argument will
# be > 0.
def factorial(num)
  product = 1
  (1..num).each do |int|
    product *= int
  end
  return product
end


# MEDIUM

# Write your own version of the join method. separator = "" ensures that the
# default seperator is an empty string.
def my_join(arr, separator = "")
  new_str = ''
  arr.each do |el|
    new_str += el.to_s
    new_str += separator if arr.index(el) != arr.length - 1
  end

  return new_str
end

# Write a method that converts its argument to weirdcase, where every odd
# character is lowercase and every even is uppercase, e.g.
# weirdcase("weirdcase") => "wEiRdCaSe"
def weirdcase(str)
  new_str = ''
  str.each_char.with_index do |char, i|
    if i % 2 != 0
      new_str += char.upcase
    else
      new_str += char.downcase
    end
  end
  return new_str
end

# Reverse all words of five more more letters in a string. Return the resulting
# string, e.g., reverse_five("Looks like my luck has reversed") => "skooL like
# my luck has desrever")
def reverse_five(str)
  arr = str.split(' ')
  new_arr = []
  arr.each do |word|
    if word.length >= 5
      new_arr << word.reverse
    else
      new_arr << word
    end
  end
  return new_arr.join(' ')
end

# Return an array of integers from 1 to n (inclusive), except for each multiple
# of 3 replace the integer with "fizz", for each multiple of 5 replace the
# integer with "buzz", and for each multiple of both 3 and 5, replace the
# integer with "fizzbuzz".
def fizzbuzz(n)
  arr = []
  (1..n).each do |int|
    if int % 3 ==0 && int % 5 == 0
      arr << 'fizzbuzz'
    elsif int % 3 == 0
      arr << 'fizz'
    elsif int % 5 == 0
      arr << 'buzz'
    else
      arr << int
    end
  end

  return arr
end


# HARD

# Write a method that returns a new array containing all the elements of the
# original array in reverse order.
def my_reverse(arr)
  new_arr = []
  arr.each do |el|
    new_arr.unshift(el)
  end
  return new_arr
end

# Write a method that returns a boolean indicating whether the argument is
# prime.
def prime?(num)
  return false if num == 1 || num == 0
  arr = []
  (1..num).each do |int|
    if num % int == 0
      arr << int
    end
  end
  if arr.length == 2
    return true
  else
    return false
  end
end

# Write a method that returns a sorted array of the factors of its argument.
def factors(num)
  new_arr = []
  (1..num).each do |int|
    if num % int == 0
      new_arr << int
    end
  end
  return new_arr.sort
end

# Write a method that returns a sorted array of the prime factors of its argument.
def prime_factors(num)
  new_arr = []
  sorted_factors_arr = factors(num)
  sorted_factors_arr.each do |factor|
    if prime?(factor)
      new_arr << factor
    end
  end
  return new_arr
end

# Write a method that returns the number of prime factors of its argument.
def num_prime_factors(num)
  return prime_factors(num).length
end


# EXPERT

# Return the one integer in an array that is even or odd while the rest are of
# opposite parity, e.g. oddball([1,2,3]) => 2, oddball([2,4,5,6] => 5)
def oddball(arr)
  odd_arr = arr.select {|int| int.odd?}
  even_arr = arr.select {|int| int.even?}
  if even_arr.length == 1
    return even_arr[0]
  else
    return odd_arr[0]
  end
end
