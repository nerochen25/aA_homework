class Temperature
  # TODO: your code goes here!
  attr_accessor :hash
  def initialize(hash = {:f => 50})
    @hash = hash
  end

  def in_celsius
    if hash.keys.include?(:f)
      c = (hash[:f] - 32) * (5/9.0)
      c
    elsif hash.keys.include?(:c)
      hash[:c]
    end
  end

  def in_fahrenheit
    if hash.keys.include?(:c)
      f = (hash[:c]/(5/9.0))+32
      f
    elsif hash.keys.include?(:f)
      hash[:f]
    end
  end

  def self.from_fahrenheit(temp)
    Temperature.new(:f => temp)
  end

  def self.from_celsius(temp)
    Temperature.new(:c => temp)
  end


end

# Subclasses/Inheritance
class Celsius < Temperature
  def from_celsius

  end
end

class Fahrenheit < Temperature

end
