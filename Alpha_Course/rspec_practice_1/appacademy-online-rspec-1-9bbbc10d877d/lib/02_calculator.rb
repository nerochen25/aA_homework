# add: takes two numbers as inputs
def add (num1, num2)
  return num1 + num2
end

# subtract: takes two numbers as inputs
def subtract (num1, num2)
  return num1 - num2
end

# sum: takes an array as input
def sum (arr)
  arr_sum = 0
  arr.each do |el|
    arr_sum += el
  end

  return arr_sum
end

# multiply: takes an arr as input
def multiply (arr)
  arr_product = 1
  arr.each do |el|
    arr_product *= el
  end

  return arr_product
end

# power: takes two numbers as inputs
def power (num1, num2)
  return num1**num2
end

# factorial: takes one single integer as input
def factorial (int)
  return 1 if int == 0 || int == 1
  result = 1
  (1..int).each do |num|
    result *= num
  end

  return result
end
