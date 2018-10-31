class Code
  PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow,
    "O" => :Orange,
    "P" => :purple,
  }
  attr_accessor :pegs

  def self.parse(str)
    colors = []
    str.upcase.split("").map do |letter|
      raise "parse error" unless PEGS.keys.include?(letter)
      colors << PEGS[letter]
    end
    Code.new(colors)  #calling initialize with parameter=colors, and @pegs = colors
  end


  def initialize(colors)
    @pegs = colors
    return @pegs
  end

  def self.random
    colors = []
    values = PEGS.values
    4.times { colors << values.sample }

    Code.new(colors)
  end


  def [](i)
    @pegs[i]
  end

  def exact_matches(other_code)
    num_exact = 0
    pegs.each_index do |i|      #pegs is the instance within the class, and it is sharable to any class methods
      if self[i] == other_code[i]
        num_exact += 1
      end
    end
    num_exact
  end

  def near_matches(other_code)
    other_color_counts = other_code.color_counts

    near_matches = 0
    self.color_counts.each do |color, count|
      next unless other_color_counts.has_key?(color)

      # Give credit for near matches up to `count`
      near_matches += [count, other_color_counts[color]].min
    end

    near_matches - self.exact_matches(other_code)
  end

  def ==(other_code)
    return false unless other_code.is_a?(Code)

    self.pegs == other_code.pegs
  end

  protected

  def color_counts
    color_counts = Hash.new(0)

    @pegs.each do |color|
      color_counts[color] += 1
    end

    color_counts
  end
end

class Game
  MAX_TURNS = 10

  attr_reader :secret_code

  def initialize(secret_code = Code.random)
    @secret_code = secret_code
  end

  def play
    MAX_TURNS.times do
      guess = get_guess

      if guess == @secret_code
        puts "You're worth it!"
        return
      end

      display_matches(guess)
    end

    puts "You aren't very good at this..."
  end

  def get_guess
    puts "Guess the code:"

    begin
      Code.parse(gets.chomp)
    rescue
      puts "Error parsing code!"
      retry
    end
  end

  def display_matches(guess)
    exact_matches = @secret_code.exact_matches(guess)
    near_matches = @secret_code.near_matches(guess)

    puts "You got #{exact_matches} exact matches!"
    puts "You got #{near_matches} near matches!"
  end
end

if __FILE__ == $PROGRAM_NAME
  Game.new.play
end
