class Ingredient < ApplicationRecord
  validates_presence_of :name
  validates :calories, presence: :true, numericality: { only_integer: true }

  has_many :recipes
  has_many :dishes, through: :recipes
end