class MyHashSet
  # TODO: your code goes here!
  attr_accessor :store
  def initialize(store = {})
    @store = store
  end

  def insert(el)
    @store[el] = true
  end

  def include?(el)
    store.keys.include?(el)
  end

  def delete(el)
    return false unless self.include?(el)
    store.delete(el)
    true
  end

  def to_a
    store.keys
  end

  def union(set2)
    new_set = self.class.new
    self.to_a.each {|el| new_set.insert(el)}
    set2.to_a.each {|el| new_set.insert(el)}
    new_set
  end

  def intersect(set2)
    new_set = self.class.new
    self.to_a.each do |el|
      new_set.insert(el) if set2.to_a.include?(el)
    end
    new_set
  end

  def minus(set2)
    new_set = self.class.new
    self.to_a.each do |el|
      new_set.insert(el) unless set2.to_a.include?(el)
    end
    new_set
  end
end
