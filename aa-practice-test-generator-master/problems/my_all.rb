class Array

  def my_all?(&prc)
    self.each do |el|
      if prc.call(el) == false
        return false
      end
    end
    return true
  end

end
