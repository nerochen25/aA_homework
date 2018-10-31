# Write a method that translates a sentence into pig latin. You may want a helper method.
# 'apple' => 'appleay'
# 'pearl' => 'earlpay'
# 'quick' => 'ickquay'
def pig_latinify(sentence)
  arr = []
  sentence.split(' ').each do |word|
    arr << word(word)
  end
  arr.join(' ')
end

def word(word)
  vowels = "aeiou".chars
  index = []

  word.chars.each_with_index do |char, i|

    if vowels.include?(char)
      if word[i-1] == 'q'
        index << (i + 1)
      else
        index << i
      end
    end
  end
  return word[index.first..-1] + word[0...index.first] + "ay"
end
