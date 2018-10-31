class Array

  def my_bsearch(target)
    return nil if size == 0
    mid = size/2

    case self[mid] <=> target
    when 0
      return mid
    when 1
      return self.dup.take(mid).my_bsearch(target)
    else
      search_res = self.dup.drop(mid+1).my_bsearch(target)
      search_res.nil? ? nil : mid + 1 + search_res
    end
  end

end

class Array

  def my_bsearch(target, &prc)
    return nil if size == 0
    mid = size/2
    prc ||= Proc.new {|x,y| x<=>y}


    case prc.call(self[mid], target)
    when 0
      return mid
    when 1
      return self.dup.take(mid).my_bsearch(target,&prc)
    else
      sub_arr = self.dup.drop(mid+1).my_bsearch(target,&prc)
      sub_arr.nil? ? nil : mid + 1 + sub_arr
    end
  end

end
