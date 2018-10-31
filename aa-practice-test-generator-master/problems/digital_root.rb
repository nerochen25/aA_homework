# Write a method, `digital_root(num)`. It should Sum the digits of a positive
# integer. If it is greater than 10, sum the digits of the resulting number.
# Keep repeating until there is only one digit in the result, called the
# "digital root". **Do not use string conversion within your method.**
#
# You may wish to use a helper function, `digital_root_step(num)` which performs
# one step of the process.

def digital_root(num)

  until num/10==0
    num = digital_root_step(num)
  end

  num
end


def digital_root_step(num)
  length = (Math.log10(num) + 1).to_i
  arr = []
  i = 1
  while i <= length
    arr << num%(10)
    num = num/10

    i += 1
  end

  arr.inject(:+)
end
