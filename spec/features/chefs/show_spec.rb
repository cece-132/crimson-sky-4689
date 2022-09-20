require 'rails_helper'

RSpec.describe Dish do
  describe 'User Story 3' do
    describe 'chef show page' do
      it 'shows the chefs name' do
        chef = Chef.create!(name: "Chef Boss")
        dish = Dish.create!(name: "Dish 1", description: "Description of food", chef_id: chef.id)
        ing = Ingredient.create!(name: "Ingredient 1", calories: 67)
        ing2 = Ingredient.create!(name: "Ingredient 2", calories: 86)
        recipe = Recipe.create!(dish_id: dish.id, ingredient_id: ing.id)
        recipe = Recipe.create!(dish_id: dish.id, ingredient_id: ing2.id)

        visit chef_path(chef)

        expect(page).to have_content("#{chef.name}")
      end

      it 'has a link to view all the ingredients they use take me through the chefs ingredient index page' do
        chef = Chef.create!(name: "Chef Boss")
        dish = Dish.create!(name: "Dish 1", description: "Description of food", chef_id: chef.id)
        ing = Ingredient.create!(name: "Ingredient 1", calories: 67)
        ing2 = Ingredient.create!(name: "Ingredient 2", calories: 86)
        recipe = Recipe.create!(dish_id: dish.id, ingredient_id: ing.id)
        recipe = Recipe.create!(dish_id: dish.id, ingredient_id: ing2.id)
        
        visit chef_path(chef)

        expect(page).to have_link("View My Ingredients")
        click_link("View My Ingredients")
        expect(current_path).to eq chef_ingredients_path(chef)
      end

    end

  end

end