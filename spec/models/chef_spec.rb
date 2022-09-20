require 'rails_helper'

RSpec.describe Chef, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
  end
  describe "relationships" do
    it {should have_many :dishes}
  end

  describe 'instance methods' do
    describe 'ingredients' do
      it ' lists all the ingredients from all the dishes' do
        chef = Chef.create!(name: "Chef Boss")
        dish = Dish.create!(name: "Dish 1", description: "Description of food", chef_id: chef.id)
        ing = Ingredient.create!(name: "Ingredient 1", calories: 67)
        ing2 = Ingredient.create!(name: "Ingredient 2", calories: 86)
        recipe = Recipe.create!(dish_id: dish.id, ingredient_id: ing.id)
        recipe = Recipe.create!(dish_id: dish.id, ingredient_id: ing2.id)

        expect(chef.ingredients).to eq [ing, ing2]
      end
    end
  end

end