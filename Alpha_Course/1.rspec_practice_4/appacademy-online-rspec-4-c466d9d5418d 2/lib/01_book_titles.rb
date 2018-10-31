class Book
  # TODO: your code goes here!
  LOWER_WORDS = [
    'the',
    'a',
    'an',
    'in',
    'on',
    'of',
    'from',
    'and'
  ]
  attr_accessor :title

  def title=(title)
    # title.split(' ').map {|word| word.capitalize}.join(' ')
    title_words = title.split(" ").map(&:downcase)
    new_words = []
    title_words.map.with_index do |word, i|
      if LOWER_WORDS.include?(word) && i != 0
        new_words << word
      else
        new_words << word.capitalize
      end
    end

    @title = new_words.join(" ")
  end
end
# class Book
#   LOWER_WORDS = [
#     "the",
#     "a",
#     "an",
#     "and",
#     "in",
#     "of"
#   ]
#
#   attr_reader :title
#
#   def title=(title)
#     title_words = title.split(" ").map(&:downcase)
#
#     new_words = []
#     title_words.map.with_index do |word, i|
#       if LOWER_WORDS.include?(word) && i != 0
#         new_words << word
#       else
#         new_words << word.capitalize
#       end
#     end
#
#     @title = new_words.join(" ")
#   end
# end
