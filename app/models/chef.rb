class Chef < ApplicationRecord
  validates_presence_of :name
  has_many :dishes

  def ingredients
    Ingredient.joins(:dishes)
    .where('dishes.chef_id = ?', self.id)
    .distinct
    .order(:name)
  end

  def top_3_ingredients
    Ingredient.select('ingredients.*, count(dishes)')
    .joins(:dishes)
    .group(:id)
    .order(count: :desc)
    .limit(3)
  end
end