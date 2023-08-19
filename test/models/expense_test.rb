require 'test_helper'

class ExpenseTest < ActiveSupport::TestCase
  def setup
    @user = FactoryBot.create(:user)
    @expense = FactoryBot.create(:expense, user: @user)
  end

  test 'should be valid' do
    assert @expense.valid?
  end

  test 'should not be valid without a name' do
    @expense.name = nil
    assert_not @expense.valid?
  end

  test 'should be associated with a user' do
    assert_equal @user, @expense.user
  end
end
