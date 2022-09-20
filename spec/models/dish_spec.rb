require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end
  describe "relationships" do
    it {should belong_to :chef}
    it { should have_many :recipes }
    it {should have_many(:ingredients).through(:recipes)}
  end

  describe 'instance methods' do
    
    describe 'calorie_count' do
      it 'finds the sum of the ingredients in a dish' do
        chef = Chef.create!(name: "Chef Boss")
        dish = Dish.create!(name: "Dish 1", description: "Description of food", chef_id: chef.id)
        ing = Ingredient.create!(name: "Ingredient 1", calories: 67)
        ing2 = Ingredient.create!(name: "Ingredient 2", calories: 86)
        recipe1 = Recipe.create!(dish_id: dish.id, ingredient_id: ing.id)
        recipe2 = Recipe.create!(dish_id: dish.id, ingredient_id: ing2.id)

        expect(dish.calorie_count).to eq 153
      end
    end
  end
end