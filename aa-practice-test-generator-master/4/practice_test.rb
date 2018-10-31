class Array

  # Write an Array#dups method that will return a hash containing the indices of all
  # duplicate elements. The keys are the duplicate elements; the values are
  # arrays of their indices in ascending order, e.g.
  # [1, 3, 4, 3, 0, 3, 0].dups => { 3 => [1, 3, 5], 0 => [4, 6] }

  def dups
    hash = Hash.new {[]}
    dupped = self.select {|int| self.count(int) > 1 }.uniq
    dupped.each do |dup|
      self.each_with_index do |el, i|
        if dup == el
          hash[dup] += [i]
        end
      end
    end
    hash
  end
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
        if i < j && el + el2 == 0
          arr << [i,j]
        end
      end
    end
    arr
  end
end

class Array

  def my_reverse
    arr = []
    i = size - 1
    while i >= 0
      arr << self[i]
      i -= 1
    end
    arr
  end

end

# primes(num) returns an array of the first "num" primes.
# You may wish to use an is_prime? helper method.

def is_prime?(num)
  arr = []
  (1..num).each do |int|
    if num%int == 0
      arr << int
    end
  end
  arr.length == 2 ? true : false
end

def primes(num)
  arr = []
  return [] if num == 0
  (1..100).each do |int|
    if is_prime?(int)
      arr << int
    end
  end
  arr.take(num)
end

class Array

  # Write a monkey patch of binary search:
  # E.g. [1, 2, 3, 4, 5, 7].my_bsearch(5) => 4
  def my_bsearch(target, &prc)
    
  end

end

class Array

  # Takes a multi-dimentional array and returns a single array of all the elements
  # [1,[2,3], [4,[5]]].my_controlled_flatten(1) => [1,2,3,4,5]
  def my_flatten

  end

  # Write a version of flatten that only flattens n levels of an array.
  # E.g. If you have an array with 3 levels of nested arrays, and run
  # my_flatten(1), you should return an array with 2 levels of nested
  # arrays
  #
  # [1,[2,3], [4,[5]]].my_controlled_flatten(1) => [1,2,3,4,[5]]
  def my_controlled_flatten(n)

  end
end
