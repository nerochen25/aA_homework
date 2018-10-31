class Temperature
  def self.from_fahrenheit(temp)
    self.new(f: temp)          #creating an hash object with k=f, v=temp
  end

  def self.from_celsius(temp)
    self.new(c: temp)         #creating an hash object with k=c, v=temp
  end

  def self.ctof(temp)
    (temp * 9 / 5.0) + 32     #coverting and returning from c to f
  end

  def self.ftoc(temp)
    (temp - 32) * (5 / 9.0)   #coverting and returning from f to c
  end

  def initialize(options)     #options as a hash arg
    if options[:f]            #if options[:f] exists, assign the f value to options[:f]
      self.fahrenheit = options[:f]
    else                      #otherwise, assign the c value to options[:c]
      self.celsius = options[:c]
    end
  end

  def fahrenheit=(temp)
    @temperature = self.class.ftoc(temp)
  end

  def celsius=(temp)
    @temperature = temp
  end

  def in_fahrenheit
    self.class.ctof(@temperature)
  end

  def in_celsius
    @temperature
  end
end

class Celsius < Temperature
  def initialize(temp)
    self.celsius = temp
  end
end

class Fahrenheit < Temperature
  def initialize(temp)
    self.fahrenheit = temp
  end
end
