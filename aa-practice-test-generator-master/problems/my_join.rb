class Array

  def my_join(str = "")
    new_str = ""
    self.each do |el|
      new_str += el + str
    end
    str == "" ? new_str : new_str[0...-1]

  end

end
