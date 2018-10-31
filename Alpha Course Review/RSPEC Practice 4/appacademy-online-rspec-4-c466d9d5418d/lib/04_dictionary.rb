class Dictionary
  # TODO: your code goes here!
  attr_accessor :entries, :keywords
  def initialize(hash = {}, arr = [])
    @entries = hash
    @keywords = arr
  end

  def add(new_entries)
    if new_entries == new_entries.to_s
      @entries[new_entries] = nil
      @keywords << new_entries

    else
      @entries = entries.merge(new_entries)
      @keywords = keywords + new_entries.keys
    end

    def keywords
      @keywords.sort
    end

    def include?(keyword)
      @keywords.include?(keyword)
    end

    def find(str)
      found_entries = {}
      @keywords.each do |word|
        if str == word || word.include?(str)
          found_entries[word] = @entries[word]
        end
      end
      found_entries
    end

    def printable
      entries = keywords.map do |keyword|
        %Q{[#{keyword}] "#{@entries[keyword]}"}
      end

      entries.join("\n")
    end

  end

end
