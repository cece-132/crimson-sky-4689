require 'rails_helper'

RSpec.describe Chef, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
  end
  describe "relationships" do
    it {should have_many :dishes}
  end

  describe 'instance methods' do
    describe '#ingredients' do
      it ' lists all the ingredients from all the dishes' do
        chef = Chef.create!(name: "Chef Boss")
        dish = Dish.create!(name: "Dish 1", description: "Description of food", chef_id: chef.id)
        ing = Ingredient.create!(name: "Ingredient 1", calories: 67)
        ing2 = Ingredient.create!(name: "Ingredient 2", calories: 86)
        recipe1 = Recipe.create!(dish_id: dish.id, ingredient_id: ing.id)
        recipe2 = Recipe.create!(dish_id: dish.id, ingredient_id: ing2.id)

        expect(chef.ingredients).to eq [ing, ing2]
      end
    end

    describe '#top_3_ingredients' do

      it 'can list a chefs top 3 ingredients' do
        chef = Chef.create!(name: "Chef Boss")
        dish = Dish.create!(name: "Dish 1", description: "Description of food", chef_id: chef.id)
        dish2 = Dish.create!(name: "Dish 2", description: "Description of food", chef_id: chef.id)
        dish3 = Dish.create!(name: "Dish 3", description: "Description of food", chef_id: chef.id)
        ing = Ingredient.create!(name: "Ingredient 1", calories: 67)
        ing2 = Ingredient.create!(name: "Ingredient 2", calories: 86)
        ing3 = Ingredient.create!(name: "Ingredient 3", calories: 92)
        ing4 = Ingredient.create!(name: "Ingredient 4", calories: 98)
        ing5 = Ingredient.create!(name: "Ingredient 5", calories: 53)
        recipe1 = Recipe.create!(dish_id: dish.id, ingredient_id: ing.id)
        recipe2 = Recipe.create!(dish_id: dish2.id, ingredient_id: ing.id)
        recipe3 = Recipe.create!(dish_id: dish3.id, ingredient_id: ing.id)
        recipe4 = Recipe.create!(dish_id: dish2.id, ingredient_id: ing2.id)
        recipe5 = Recipe.create!(dish_id: dish3.id, ingredient_id: ing2.id)
        recipe5 = Recipe.create!(dish_id: dish3.id, ingredient_id: ing3.id)

        expect(chef.top_3_ingredients).to eq [ing, ing2, ing3]
      end
    end
  end

end