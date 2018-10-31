class String

  # Write a String#symmetric_substrings method that returns an array of substrings
  # that are palindromes, e.g. "cool".symmetric_substrings => ["oo"]
  # Only include substrings of length > 1.

  def symmetric_substrings
    result = []
    i = 1
    while i <= self.length
      self.chars.each_cons(i) do |combo|
        if combo == combo.reverse && combo.length > 1
          result << combo.join("")
        end
      end
      i += 1
    end
    result
  end
end
