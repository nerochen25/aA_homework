# Write a recursive method that returns all of the permutations of an array
def permutations(array)
  return [array] if array.length == 1

  first = array.shift
  perms = permuations(array)
  total = []
  array.each_with_index do |el,i|
    new_arr = [[array]]
    temp = []
    arry.each_with_index do |el2,j|
      temp << el
    end
  end
  [[array]] + permutation(new_arr)

end

# Write a method that returns the median of elements in an array
# If the length is even, return the average of the middle two elements
class Array
  def median #{1,2,3,4,5,6} 0,1,2,3,4,5
    return nil if self == []
    return self.first if self.length == 1
    mid = self.length/2
    sorted_arr = self.sort
    if self.length.odd?
      return sorted_arr[mid]
    elsif self.length.even?
      return (sorted_arr[mid-1] + sorted_arr[mid])/2.0
    end
  end
end

class Array

  # Write a monkey patch of binary search:
  # E.g. [1, 2, 3, 4, 5, 7].my_bsearch(5) => 4
  def my_bsearch(target, &prc)
    mid = size/2
    return nil if size == 0
    prc ||= Proc.new {|x,y| x<=>y}

    return mid if prc.call(self[mid], target) == 0

    if prc.call(self[mid], target) == 1 #dont include mid5
      self.dup[0...mid].my_bsearch(target,&prc)
    else
      sub_arr = self.dup[mid+1..-1].my_bsearch(target,&prc)
      sub_arr.nil? ? nil : mid + 1 + sub_arr
    end

    # self.length/2 + sub_arr.my_bsearch(target, &prc)
  end

end

class Array
  def bubble_sort!(&prc)
    prc ||= Proc.new { |x, y| x <=> y }
    # return self if self.length == 1 || self.length == 0

    sorted = false
    until sorted
      sorted = true
      self.each_index do |i|
        next if i + 1 == self.length
        j = i + 1
        if prc.call(self[i], self[j]) == 1
          sorted = false
          self[i], self[j] = self[j], self[i]
        end
      end

    end
    self
  end


  def bubble_sort(&prc)
    self.dup.bubble_sort!(&prc)
  end
end
