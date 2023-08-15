# test/models/recipe_test.rb
require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  def setup
    @user = FactoryBot.create(:user)
    @recipe = FactoryBot.create(:recipe, user: @user)
  end

  test 'should be valid' do
    assert @recipe.valid?
  end

  test 'should not be valid without a name' do
    @recipe.name = nil
    assert_not @recipe.valid?
  end

  test 'should be associated with a user' do
    assert_equal @user, @recipe.user
  end
end
