# return the sum of the first n even numbers recursively. Assume n > 0
def first_even_numbers_sum(n)
  return 0 if n == 0
  first_even = 2
  even_num = n * 2
  even_num + first_even_numbers_sum(n-1)
end
