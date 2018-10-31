# class Board
# end

class Board
  DISPLAY_HASH = {
    nil => " ",
    :s => " ",
    :x => "x"
  }

  attr_reader :grid

  def initialize(grid = self.class.default_grid, random = false)
    @grid = grid
    randomize if random
  end

  #call initialize, ex:
  #nero = Board.new(Board.default_grid, true)
  #p nero.grid

  def randomize(count = 10) #default value, 10, max value is 90
    count.times { place_random_ship }
  end

  def count
    grid.flatten.select { |el| el == :s }.length #count the num of :s once grid is flattened, 100 in total
  end

  def self.default_grid
    Array.new(10) { Array.new(10) } #create 10x10
  end

  def self.random
    self.new(self.default_grid, true)
  end

  #p Board.random => randomly generate 10 :s

  def place_random_ship
    raise "hell" if full? #num about 90 will be full
    pos = [rand(grid.length),rand(grid.length)]

    until empty?(pos)
      pos = [rand(grid.length),rand(grid.length)]
    end

    self[pos] = :s
  end

  def full?
    grid.flatten.none?(&:nil?)  #apply to place_random_ship
  end

  def [](pos)
    row, col = pos
    grid[row][col]
  end

  def []=(pos, val)
    row, col = pos
    grid[row][col] = val
  end

  def display
    header = (0..9).to_a.join("  ")
    p "  #{header}"
    grid.each_with_index { |row, i| display_row(row, i) }
  end

  def display_row(row, i)
    chars = row.map { |el| DISPLAY_HASH[el] }.join("  ")
    p "#{i} #{chars}"
  end

  def empty?(pos = nil)
    if pos
      self[pos].nil?
    else
      count == 0
    end
  end

  def in_range?(pos)
    pos.all? { |x| x.between?(0, grid.length - 1) }
  end


  # def random_pos
  #   [rand(size), rand(size)]
  # end
  #
  # def size
  #   grid.length
  # end

  def won?
    grid.flatten.none? { |el| el == :s }
  end
end
