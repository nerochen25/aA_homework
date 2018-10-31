class RPNCalculator
  attr_accessor :stack
  OPERATORS = [:+, :-, :*, :/] #name of class variable must be all caps

  def initialize
    @stack = []     #initialize an instance @stack with an empty arr
  end

  def push(num)
    @stack << num
  end

  def tokens(string)    #turn string into chars and turn chars into integers/symbols and store them into an arr
    chars_arr = string.split(" ")
    chars_arr.map! do |char|
      if OPERATORS.include?(char.to_sym)
        char.to_sym
      else
        char.to_i
      end
    end
    chars_arr      #return an array with modified els
  end

  def operator(sym)
    raise "calculator is empty" if @stack.count < 2 #raise errormessage if num of els is less than 2

    right = @stack.pop
    left = @stack.pop

    @stack << left + right if sym == :+
    @stack << left - right if sym == :-
    @stack << left * right if sym == :*
    @stack << left.fdiv(right) if sym == :/

    self
  end

  def value
    @stack.last
  end

  def evaluate(string)
    tokens(string).each do |token|
      case token
      when Integer
        push(token)
      when Symbol
        operator(token)
      end
    end

    value
  end

  def divide
    operator(:/)
  end

  def minus
    operator(:-)
  end

  def plus
    operator(:+)
  end

  def times
    operator(:*)
  end


end
