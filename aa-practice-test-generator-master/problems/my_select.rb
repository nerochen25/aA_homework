class Array

  def my_select(&prc)
    arr = []
    each do |el|
      if prc.call(el) == true
        arr << el
      end
    end
    arr 
  end

end
