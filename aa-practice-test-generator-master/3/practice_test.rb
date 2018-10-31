class Array

  # Takes a multi-dimentional array and returns a single array of all the elements
  # [1,[2,3], [4,[5]]].my_controlled_flatten(1) => [1,2,3,4,5]
  def my_flatten
    arr = []
    self.each do |sub|
      if sub.kind_of?(Array)
        arr += sub.my_flatten ##REMEMBER HERE
      else
        arr << sub
      end
    end
    arr
  end

  # Write a version of flatten that only flattens n levels of an array.
  # E.g. If you have an array with 3 levels of nested arrays, and run
  # my_flatten(1), you should return an array with 2 levels of nested
  # arrays
  #
  # [1,[2,3], [4,[5]]].my_controlled_flatten(1) => [1,2,3,4,[5]]
  def my_controlled_flatten(n)
    return self if n < 1
    arr = []

    self.each do |sub|
      if sub.kind_of?(Array)
        arr += sub.my_controlled_flatten(n-1) ##REMEMBER HERE
      else
        arr << sub
      end
    end
    arr
  end

end

class Array

  def my_rotate(num = 1)
    # num ||= 1
    num = (num%size).abs
    return self if num == 0 || num == nil
    if num > 0
      return self[num..-1] + self[0...num]
    end
    if num < 0
      return self[size-num..-1] + self[0...size-num]
    end

  end

end
