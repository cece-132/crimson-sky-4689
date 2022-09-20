require 'rails_helper'

RSpec.describe Dish do
  describe 'User Story 3' do
    describe 'chef show page' do
      it 'shows the chefs name' do
        chef = Chef.create!(name: "Chef Boss")
        dish = Dish.create!(name: "Dish 1", description: "Description of food", chef_id: chef.id)
        ing = Ingredient.create!(name: "Ingredient 1", calories: 67)
        ing2 = Ingredient.create!(name: "Ingredient 2", calories: 86)
        recipe1 = Recipe.create!(dish_id: dish.id, ingredient_id: ing.id)
        recipe2 = Recipe.create!(dish_id: dish.id, ingredient_id: ing2.id)

        visit chef_path(chef)

        expect(page).to have_content("#{chef.name}")
      end

      it 'has a link to view all the ingredients they use take me through the chefs ingredient index page' do
        chef = Chef.create!(name: "Chef Boss")
        dish = Dish.create!(name: "Dish 1", description: "Description of food", chef_id: chef.id)
        ing = Ingredient.create!(name: "Ingredient 1", calories: 67)
        ing2 = Ingredient.create!(name: "Ingredient 2", calories: 86)
        recipe1 = Recipe.create!(dish_id: dish.id, ingredient_id: ing.id)
        recipe2 = Recipe.create!(dish_id: dish.id, ingredient_id: ing2.id)
        
        visit chef_path(chef)

        expect(page).to have_link("View My Ingredients")
        click_link("View My Ingredients")
        expect(current_path).to eq chef_ingredients_path(chef)
      end

    end

  end

  describe 'EXTENSION' do
    describe '3 most popular dishes' do
      it 'can sort ingredients by popularity' do
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
        
        visit chef_path(chef)

        within "#top_3_ing" do
          expect(page).to_not have_content("#{ing4.name}")
          expect(page).to_not have_content("#{ing5.name}")
          expect(page).to have_content("#{ing.name}")
          expect(page).to have_content("#{ing2.name}")
          expect(page).to have_content("#{ing3.name}")
          
          expect("#{ing.name}").to appear_before("#{ing2.name}")
          expect("#{ing2.name}").to appear_before("#{ing3.name}")
          expect("#{ing3.name}").to_not appear_before("#{ing.name}")
        end
      end
    end
  end

end