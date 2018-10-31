# Jumble sort takes a string and an alphabet. It returns a copy of the string
# with the letters re-ordered according to their positions in the alphabet. If
# no alphabet is passed in, it defaults to normal alphabetical order (a-z).

# Example:
# jumble_sort("hello") => "ehllo"
# jumble_sort("hello", ['o', 'l', 'h', 'e']) => 'ollhe'

def jumble_sort(str, alphabet = nil)
  new_order = []
  alphabet = ('a'..'z').to_a if alphabet == nil
  alphabet.each do |ltr|
    str.chars.each_with_index do |ltr2,i|
      if ltr == ltr2
        new_order << ltr
      end
    end
  end
  new_order.join('')

end
