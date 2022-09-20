class Recipe <ApplicationRecord
  validates_presence_of :ingredient_id
  validates_presence_of :dish_id

  belongs_to :ingredient
  belongs_to :dish
end