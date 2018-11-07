class House <ActiveRecord::Base
  validates :address, presence: true
  has_many :residents,
    primary_key: :id,
    foreign_key: :house_id,
    class_name: :Person
  # def cats
  #   Cat.where(house_id: self.id)
  # end
  # def toys
  #   toys = []
  #   self.cats.each do |cat|
  #     toys += cat.toys
  #   end
  # end

  ###OR##
end
