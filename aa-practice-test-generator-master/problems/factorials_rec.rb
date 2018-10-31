# Write a recursive method that returns the first "num" factorial numbers.
# Note that the 1st factorial number is 0!, which equals 1. The 2nd factorial
# is 1!, the 3rd factorial is 2!, etc.

def factorials_rec(num)
  return [1] if num == 1
  # return [1,1] if num == 2
  factorial = factorial(num-1)
  factorials_rec(num-1) + [factorial]
end

def factorial(num)
  return 1 if num == 0 || num == 1
  result = num
  until num == 1
    num -= 1
    result *= num
  end
  result
end
