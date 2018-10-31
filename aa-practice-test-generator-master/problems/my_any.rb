class Array

  def my_any?(&prc)
    self.each do |el|
      if prc.call(el) == true
        return true
      end
    end
    false
  end

end
