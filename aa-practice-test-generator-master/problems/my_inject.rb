class Array

  # Monkey patch the Array class and add a my_inject method. If my_inject receives
  # no argument, then use the first element of the array as the default accumulator.

  def my_inject(accumulator = nil, &prc)
    i = 0
    if accumulator.nil?
      accumulator = self.first
      i += 1
    end

    while i < self.length
      accumulator = prc.call(accumulator,self[i])
      i += 1
    end
    accumulator
  end
end
