# Write a recursive function that returns the prime factorization of
# a given number. Assume num > 1
#
# prime_factorization(12) => [2,2,3]
def prime_factorization(num)
  return [] if num == 1

  (2..Math.sqrt(num).ceil).each do |i|
    if num % i == 0
      return [i] + prime_factorization(num/i)
    end
  end
  return [num]
end

# def is_prime?(num)
#   return false if num <= 1
#   arr = []
#   (1..num).each do |int|
#     if num%int == 0
#       arr << int
#     end
#   end
#   return true if arr.length == 2
#   false
# end
