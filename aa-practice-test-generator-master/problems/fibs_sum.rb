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
