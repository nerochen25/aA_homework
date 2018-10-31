# Write a method that returns the factors of a number in ascending order.

def factors(num)
  arr = []
  (1..num).each do |int|
    arr << int if num%int == 0
  end
  arr
end

class Array

  # Write an Array#dups method that will return a hash containing the indices of all
  # duplicate elements. The keys are the duplicate elements; the values are
  # arrays of their indices in ascending order, e.g.
  # [1, 3, 4, 3, 0, 3, 0].dups => { 3 => [1, 3, 5], 0 => [4, 6] }

  def dups
    hash = Hash.new {[]}
    dups = self.select {|int| self.count(int) > 1}.uniq

    dups.each do |int|
      self.each_with_index do |int1, i|
        if int == int1
          hash[int] += [i]
        end
      end
    end
    hash
  end
end
