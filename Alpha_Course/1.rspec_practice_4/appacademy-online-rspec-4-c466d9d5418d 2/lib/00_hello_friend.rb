class Friend
  # TODO: your code goes here!
  attr_reader :name

  def initialize(name='Bob')
    @name = name
  end

  def greeting(name = nil)
    return "Hello!" unless name
    return "Hello, #{@name}!" if name
  end
end

# class Friend
#   attr_reader :name
#
#   def initialize(name = "Bob")
#     @name = name
#   end
#
#   def greeting(name = nil)
#     if name
#       "Hello, #{name}!"
#     else
#       "Hello!"
#     end
#   end
# end
