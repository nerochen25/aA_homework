class Hash

  # Write a version of merge. This should NOT modify the original hash
  def my_merge(hash2)
    new_hash = {}
    dupped = self.dup
    # dupped.each do |k,v|
      hash2.each do |k2,v2|
        if dupped.keys.include?(k2)
          dupped[k2] = hash2[k2]
        else
          dupped[k2] = v2
        end
      end
    # end
    dupped
  end

end
