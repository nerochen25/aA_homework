class Hash

  # Write a version of my each that calls a proc on each key, value pair
  def my_each(&prc)
    i = 0
    while i < self.length
      prc.call(self.keys[i], self.values[i])
      i += 1
    end
    self
  end

end
