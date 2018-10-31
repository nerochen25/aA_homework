class Book
  # TODO: your code goes here!
  LOWER_WORDS = [
    'a',
    'an',
    'to',
    'from',
    'and',
    'in',
    'on',
    'the',
    'of'
  ]
  attr_accessor :title

  def title=(title)
    lower_case = title.downcase.split(' ')
    lower_case.map! do |word|
      unless LOWER_WORDS.include?(word)
        word.capitalize
      else
        word
      end
    end
    lower_case[0] = lower_case[0].capitalize

    @title = lower_case.join(' ')
  end

end

#how to call
#new_book = Book.new
#new_book.title = 'who is inside'
#new_book.title => "Who is Inside"
