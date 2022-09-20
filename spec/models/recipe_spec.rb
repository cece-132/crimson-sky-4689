require 'rails_helper'

RSpec.describe Recipe, type: :model do
  describe "validations" do
    it {should validate_presence_of :ingredient_id}
    it {should validate_presence_of :dish_id}
  end
  describe "relationships" do
    it {should belong_to :ingredient}
    it {should belong_to :dish}
  end
end