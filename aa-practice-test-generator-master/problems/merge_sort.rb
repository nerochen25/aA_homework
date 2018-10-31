class Array

  # Write an Array#merge_sort method; it should not modify the original array.

  def merge_sort(&prc)
    dupped = self
    return dupped if dupped.length <= 1
    prc ||= Proc.new {|x,y| x <=> y}
    mid = size/2

    left = dupped[0...mid].merge_sort(&prc)
    right = dupped[mid..-1].merge_sort(&prc)

    Array.merge(left,right,&prc)


  end

  private
  def self.merge(left, right, &prc)
    result = []
    until left.empty? || right.empty?
      if prc.call(left.first, right.first) == -1
        result << left.shift
      else
        result << right.shift
      end
    end

    result += left
    result += right
    result
  end
end
