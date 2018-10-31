class RPNCalculator
  # TODO: your code goes here!
  attr_accessor :calculator, :result

  def initialize(calculator = [])
    @calculator = calculator
  end

  def plus
    @calculator << calculator.inject(:&+)
  end

  def value
    result = @calculator
    result[0]
  end

end
