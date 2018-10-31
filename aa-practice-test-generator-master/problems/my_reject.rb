class Array

  def my_reject(&prc)
    arr = []
    each do |el|
      if prc.call(el) == false
        arr << el
      end
    end
    arr
  end

end
