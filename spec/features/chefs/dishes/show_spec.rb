require 'rails_helper'

RSpec.describe Dish do
  describe 'User Story 1 and 2' do
    
    describe 'show page presents a dish attributes' do
      it 'show page presents dishes name and description' do
        chef = Chef.create!(name: "Chef Boss")
        dish = Dish.create!(name: "Dish 1", description: "Description of food", chef_id: chef.id)
        ing = Ingredient.create!(name: "Ingredient 1", calories: 67)
        ing2 = Ingredient.create!(name: "Ingredient 2", calories: 86)
        recipe1 = Recipe.create!(dish_id: dish.id, ingredient_id: ing.id)
        recipe2 = Recipe.create!(dish_id: dish.id, ingredient_id: ing2.id)

        visit chef_dish_path(chef, dish)

        within ".dish" do
          expect(page).to have_content("#{dish.name}")
          expect(page).to have_content("#{dish.description}")
            within ".dish-ingredients" do
              expect(ing.name).to appear_before(ing2.name)
              expect(ing2.name).to_not appear_before(ing.name)
            end
          expect(page).to have_content("Calorie Count: #{ing.calories + ing2.calories}")
          expect(page).to have_content("#{chef.name}")
        end

      end
    end

  end
end