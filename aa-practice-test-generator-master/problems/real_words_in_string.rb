class String
  # Returns an array of all the subwords of the string that appear in the
  # dictionary argument. The method does NOT return any duplicates.

  def real_words_in_string(dictionary)
    all_combos = []
    result = []
    i = 1
    while i <= self.length
      self.chars.each_cons(i) do |combo|
        all_combos << combo.join('')
      end
      i += 1
    end

    dictionary.each do |word|
      if all_combos.include?(word)
        result << word
      end
    end
    result
  end
end
