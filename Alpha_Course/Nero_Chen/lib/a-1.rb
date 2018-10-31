# Given an array of unique integers ordered from least to greatest, write a
# method that returns an array of the integers that are needed to
# fill in the consecutive set.

def missing_numbers(nums)

  result = []
  min_num = nums.first
  max_num = nums.last

  (min_num..max_num).each do |num|
    unless nums.include?(num) == true
      result.push(num)
    end
  end

  result
end

# Write a method that returns the nth prime number
def nth_prime(n)
  return nil if n == 0
  result = []
  (1..100).each do |num|
    if is_prime?(num)
      result << num
    end
  end

  result[n-1]

end

def is_prime?(num)
  return false if num <= 1

  i = 2
  while i < num
    if (num % i) == 0
      return false
    end

    i += 1
  end

  return true
end

class Hash
  # Hash#select passes each key-value pair of a hash to the block (the proc
  # accepts two arguments: a key and a value). Key-value pairs that return true
  # when passed to the block are added to a new hash. Key-value pairs that return
  # false are not. Hash#select then returns the new hash.
  #
  # Write your own Hash#select method by monkey patching the Hash class. Your
  # Hash#my_select method should have the functionailty of Hash#select described
  # above. Do not use Hash#select in your method.

  def my_select(&prc)
    result = {}
    self.each {|k,v| result[k] = v if prc.call(k,v)}
    result
  end
end

# A palindrome is a word or sequence of words that reads the same backwards as
# forwards. Write a method that returns the length of the longest palindrome in
# a given string. If there is no palindrome longer than two letters, return false.

def longest_palindrome(string)
  arr = []
  length = string.length
  (2..length).each do |num|
    arr << num if string.chars.each_cons(num).find {|chars| chars == chars.reverse}
  end
  arr.max || false
end

class Array
  # Write a method that calls a passed block for each element of the array
  def my_each(&prc)
    i = 0
    while i < self.length
      prc.call(self[i])


      i += 1
    end
    self
  end
end

class Array
  # Write an Array method that returns a bubble-sorted copy of an array.
  # Do NOT call the built-in Array#sort method in your implementation.
  def bubble_sort(&prc)
    arr = self
    prc ||= Proc.new { |x, y| x <=> y }

    sorted = true
    while sorted
      sorted = false

      each_index do |i|
        next if i + 1 == arr.length
        j = i + 1
        if prc.call(arr[i], arr[j]) == 1
          sorted = true
          arr[i], arr[j] = arr[j], arr[i]
        end
      end
    end

    self
  end

  # You are not required to implement this; it's here as a suggestion :-)
  def bubble_sort!(&prc)

  end
end

# The following is a skeleton of three classes you will be asked to define to
# pass the related specs. Please read the specs carefully to determine the
# functionality and instance variables you should give each class. Show us your
# object-oriented programming skills!

class Cat
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def meow
    'meow'
  end

  def receive_love
    meow
  end

end

class Dog < Cat
  BREEDS = ['Husky', 'Black Labrador', 'German Shepherd', 'Chihuahua']
  attr_accessor :name, :breed
  def initialize(name, breed)
    @name = name
    @breed = breed
  end

  def play_with
    receive_love
  end


end

class Human < Dog
  attr_accessor :name
  def initialize(name)
    @name = name
  end

  def self.play_with
    return true if Dog.new
  end
end
