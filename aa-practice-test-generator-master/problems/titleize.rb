# Write a method that capitalizes each word in a string like a book title
# Do not capitalize words like 'a', 'and', 'of', 'over' or 'the'
def titleize(title)
  arr = []
  title.split(' ').each do |word|
    arr << word(word)
  end
  arr[0] = arr.first.capitalize
  arr.join(' ')
end


def word(word)
  words = ['a', 'and', 'of', 'over','the']
  unless words.include?(word)
    return word.capitalize
  else
    return word
  end
end
