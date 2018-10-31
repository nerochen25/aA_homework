def translate_one_word (word)
  vowels_arr = 'aeiou'.split('')
  # qu
  word.each_char.with_index do |char, i|
    if word[i..i+1] == 'qu'
      return word[i+2..-1] + word[0..i+1] + 'ay'
    end
  end

  # sch
  word.each_char.with_index do |char, i|
    if word[i..i+2] == 'sch'
      return word[i+3..-1] + word[0..i+2] + 'ay'
    end
  end

  # regular
  word.each_char.with_index do |char, i|
    if vowels_arr.include?(char)
      return word[i..-1] + word[0...i] + 'ay'
    end
  end
end


def translate (str)
  word_arr = str.split(' ')
  new_arr = []
  word_arr.each do |word|
    new_arr << translate_one_word(word)
  end
  return new_arr.join(' ')
end
