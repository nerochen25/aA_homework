# Using recursion and the is_a? method,
# write an Array#deep_dup method that will perform a "deep" duplication of the interior arrays.

def deep_dup(arr)
  return arr if arr.length <= 1
  arr.map do |el|
    if el.kind_of?(Array)
      deep_dup(el)
    else
      el
    end
  end
end
