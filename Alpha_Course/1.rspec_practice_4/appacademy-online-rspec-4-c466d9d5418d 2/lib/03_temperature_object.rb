# class Temperature
#   # TODO: your code goes here!
#   # F -> C: (F-32) * 5/9
#   # C -> F: (C*5/9) + 32
#
# end
#
# # Subclasses/Inheritance
# class Celsius < Temperature
#
# end
#
# class Fahrenheit < Temperature
#
# end

####PROCESS######
# 1. use Temperature.new to assign value to temp on either one of the first two facotry functions.
# 2. after we wrote Temperature.new({:f=>50}) for example, we can add '.any_method' before that to get different results.
# 3. For example now is Temperature.new({:c=>0}.in_fahrenheit, return 32
class Temperature
  def self.from_fahrenheit(temp)
    Temperature.new({:f=>temp})          #creating an hash object with k=f, v=temp
  end                                 #line 19, we can either use Temperature.new or self.new
                                      #same as line 23
  def self.from_celsius(temp)
    Temperature.new({:c=>temp})         #creating an hash object with k=c, v=temp
  end

  def self.ctof(temp)
    result = (temp * 9 / 5.0) + 32     #helper function: coverting and returning from c to f
    result
  end

  def self.ftoc(temp)
    result = (temp - 32) * (5 / 9.0)   #helper function: coverting and returning from f to c
    result
  end

  def initialize(options)     #options as a hash arg
    if options[:f]            #if we call Temperature.new({:f=>50}), then options[:f] has value and which it is true and exists, and assign 50 as value of the pair
      self.fahrenheit = options[:f]
    else                      #otherwise, assign the c value to options[:c]
      self.celsius = options[:c]
    end
  end

  def fahrenheit=(temp)   #value assignment function: store the converted value to the class instance, @temperature
    @temperature = self.class.ftoc(temp) #use self.class here becuase ftoc is a factory method
  end

  def celsius=(temp)      #value assignment function: store the converted value to the class instance, @temperature
    @temperature = temp  #temperature as class instance
  end

  def in_fahrenheit
    self.class.ctof(@temperature)
  end

  def in_celsius
    @temperature
  end
end

class Celsius < Temperature   # "<" means borrowing class methods from class Temperature
  def initialize(temp)
    self.celsius = temp       # class Celsius is using the celsius method from class Temperature
  end
end

class Fahrenheit < Temperature  #same as above
  def initialize(temp)
    self.fahrenheit = temp
  end
end
