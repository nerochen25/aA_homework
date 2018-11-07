class Person < ActiveRecord::Base
  validates :name, :house, presence: true

  # def no_green_cats
  #   if self.color == 'green'
  #     self.errors[:color] << "can't be green"
  #   end
  # end
  # def house
  #   #house for each cat
  #   House.find(self.house_id)
  # end
  ####OR#####
  #return the house name that the cat lives in
  belongs_to :house,
    primary_key: :id,
    foreign_key: :house_id,
    class_name: :House

  # has_many :toys,
  #   primary_key: :id,
  #   foreign_key: :cat_id,
  #   class_name: 'Toy'


end
