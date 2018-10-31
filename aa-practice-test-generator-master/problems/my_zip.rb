class Array

  def my_zip(*arrs)
    size = self.length
    arr = []
    i = 0
    while i < size
      temp = [self[i]]
      arrs.each do |subarr|
        temp << subarr[i]
      end
      arr << temp
      i += 1
    end
    arr
  end

end
