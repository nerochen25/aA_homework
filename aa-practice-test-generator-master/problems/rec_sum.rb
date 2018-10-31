# Write a recursive method that returns the sum of all elements in an array
def rec_sum(nums)
  return 0 if nums.empty?
  first_el = nums.pop
  first_el + rec_sum(nums)
end
