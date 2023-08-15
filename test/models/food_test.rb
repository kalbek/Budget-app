# test/models/food_test.rb
require 'test_helper'

class FoodTest < ActiveSupport::TestCase
  def setup
    @user = FactoryBot.create(:user)
    @food = FactoryBot.create(:food, user: @user)
  end

  test 'should be valid' do
    assert @food.valid?
  end

  test 'should not be valid without a name' do
    @food.name = nil
    assert_not @food.valid?
  end

  test 'should not be valid with a negative quantity' do
    @food.quantity = -1
    assert_not @food.valid?
  end

  test 'should be valid with a zero quantity' do
    @food.quantity = 0
    assert @food.valid?
  end

  test 'should be associated with a user' do
    assert_equal @user, @food.user
  end
end
