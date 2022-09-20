require 'rails_helper'

RSpec.describe Dish do
  describe 'User Story 3.5' do
    describe 'chef ingredient show page' do
      it 'has a distinct list of all the ingredients that the chef uses' do
        chef = Chef.create!(name: "Chef Boss")
        dish = Dish.create!(name: "Dish 1", description: "Description of food", chef_id: chef.id)
        dish2 = Dish.create!(name: "Dish 2", description: "Description of food", chef_id: chef.id)
        ing = Ingredient.create!(name: "Ingredient 1", calories: 67)
        ing2 = Ingredient.create!(name: "Ingredient 2", calories: 86)
        ing2 = Ingredient.create!(name: "Ingredient 3", calories: 92)
        recipe = Recipe.create!(dish_id: dish.id, ingredient_id: ing.id)
        recipe = Recipe.create!(dish_id: dish.id, ingredient_id: ing2.id)
        recipe = Recipe.create!(dish_id: dish2.id, ingredient_id: ing2.id)

        visit chef_ingredients_path(chef)

        within ".ingredients" do
          within "#ing-#{ing2.id}" do
            expect(page).to have_content("#{ing2.name}")
          end
        end
        
      end
    end
  end
end