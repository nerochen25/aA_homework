class Array

  #Write a monkey patch of quick sort that accepts a block
  def my_quick_sort(&prc)
    return self if self.length <= 1
    prc ||= Proc.new {|x,y| x <=> y}

    pivot = self.first
    left = self[1..-1].select {|el| prc.call(pivot,el) == 1}
    right = self[1..-1].select {|el| prc.call(pivot,el) != 1}
    left.my_quick_sort(&prc) + [pivot] + right.my_quick_sort(&prc)
  end

end
