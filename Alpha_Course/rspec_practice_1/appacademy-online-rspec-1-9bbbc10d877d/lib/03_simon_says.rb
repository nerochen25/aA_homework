# echo
def echo (str)
  return str
end

# shout
def shout (str)
  return str.upcase
end

# repeat
def repeat (str, num_of_time = 2)
  arr = []
  num_of_time.times { arr << str }
  return arr.join(' ')
end

# start_of_word
def start_of_word (str, int)
  return str[0...int]
end

# first_word
def first_word (sentence)
  return sentence.split(' ').first
end

# titleize
def titleize (str)
  words_no_cap = ["and", "or", "the", "over", "to", "the", "a", "but"]
  arr = str.split(' ')
  arr.each do |word|
    word.capitalize! unless words_no_cap.include?(word)
  end
  arr[0] = arr[0].capitalize
  return arr.join(' ')
end
