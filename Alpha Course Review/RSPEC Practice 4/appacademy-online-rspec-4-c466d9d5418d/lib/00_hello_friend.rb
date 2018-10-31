class Friend
  # TODO: your code goes here!
  def initialize

  end
  def greeting(name = nil)
    if name == nil
      p 'Hello!'
    else
      p "Hello, #{name}!"
    end
  end
end
