# class HumanPlayer
# end
class HumanPlayer
  def initialize(player_name) #start with player name
    @player_name = player_name
  end

  def get_play    #input as '1 2'
    gets.chomp.split(" ").map do |el| #split string of integers with space as separater
      el.to_i
    end
  end

  # def prompt
  #   puts "Please enter a target square (i.e., '3,4')"
  #   print "> "
  # end
end
