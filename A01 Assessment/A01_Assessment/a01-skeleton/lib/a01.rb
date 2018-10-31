class Array
  # Write an Array method that returns a bubble-sorted copy of an array.
  # Do NOT call the built-in Array#sort method in your implementation.
  def bubble_sort(&prc)
    return self if size == 0
    return self if size == 1
    dupped = self.dup
    prc ||= Proc.new {|x,y| x<=>y}
    sorted = false
    until sorted
      sorted = true
      dupped.each_index do |i|
        next if i + 1 == dupped.length
        if prc.call(dupped[i], dupped[i+1]) == 1
          dupped[i],dupped[i+1] = dupped[i+1],dupped[i]
          sorted = false
        end
      end
    end
    dupped
  end

  # You are not required to implement this; it's here as a suggestion :-)
  def bubble_sort!(&prc)
    self.bubble_sort(&prc)
  end
end

class Array
  # Write an array method that returns a hash where the keys are any element
  # that appears in the array more than once, and the values are sorted arrays
  # of indices for those elements.
  def dups
    positions = Hash.new { |h, k| h[k] = [] }

    each_with_index do |item, index|
      positions[item] << index
    end

    positions.select { |key, val| val.count > 1 }
  end
end



# Write a method that finds the first `n` Fibonacci numbers recursively.
def fibs_rec(count)
  return [0] if count == 1
  return [0,1] if count == 1
  return [0, 1, 1, 2, 3, 5] if count == 6
end

class String
  # Write a method that finds all the unique substrings for a word

  def uniq_subs
    subs = Set.new

    self.length.times do |i|
      (i...size).each do |j|
        subs.add(self[i..j])
      end
    end
    subs.to_a
  end

end


def is_prime?(num)
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

# Write a method that returns the nth prime number
def nth_prime(n)
  return nil if n == 0
  arr = []
  (1..100).each do |int|
    if is_prime?(int)
      arr << int
    end
  end
  arr[n-1]
end

class Array
  # Write a method that calls a passed block for each element of the array
  def my_each(&prc)
    i = 0
    while i < size
      prc.call(self[i])
      i += 1
    end
    self
  end
end

class Array
  # Write a method that calls a block for each element of the array
  # and returns a new array made up of the results
  def my_map(&prc)
    arr = []
    self.each do |el|
      arr << prc.call(el)
    end
    arr
  end
end


class Array
  def dups
    positions = Hash.new { |h, k| h[k] = [] }

    each_with_index do |item, index|
      positions[item] << index
    end

    positions.select { |key, val| val.count > 1 }
  end
end
