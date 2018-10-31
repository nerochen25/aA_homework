# Implement a method that finds the sum of the first n
# fibonacci numbers recursively. Assume n > 0
def fibs_sum(n)
  return n if n == 1 || n == 2
  arr = [1,1]
  i = n
  until i == 2
    arr << arr[-2..-1].inject(:+)
    i -= 1
  end

  # p arr
  arr[-2..-1].inject(:+) + fibs_sum(n-2)
end

class Array

  def my_rotate(num)

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

  end
end

# Jumble sort takes a string and an alphabet. It returns a copy of the string
# with the letters re-ordered according to their positions in the alphabet. If
# no alphabet is passed in, it defaults to normal alphabetical order (a-z).

# Example:
# jumble_sort("hello") => "ehllo"
# jumble_sort("hello", ['o', 'l', 'h', 'e']) => 'ollhe'

def jumble_sort(str, alphabet = nil)
  new_order = []
  alphabet = ('a'..'z').to_a if alphabet == nil
  alphabet.each do |ltr|
    str.chars.each_with_index do |ltr2,i|
      if ltr == ltr2
        new_order << ltr
      end
    end
  end
  new_order.join('')

end

