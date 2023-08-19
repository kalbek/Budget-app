require 'test_helper'

class PaymentTest < ActiveSupport::TestCase
  def setup
    @user = FactoryBot.create(:user)
    @expense = FactoryBot.create(:expense, user: @user)
    @payment = FactoryBot.create(:payment, author: @user, expense: @expense)  # Fix the author association here
  end

  test 'should be valid' do
    assert @payment.valid?
  end

  test 'should not be valid without a name' do
    @payment.name = nil
    assert_not @payment.valid?
  end

  test 'should not be valid with a negative amount' do
    @payment.amount = -10
    assert_not @payment.valid?
  end

  test 'should be associated with a user' do
    assert_equal @user, @payment.author
  end

  test 'should be associated with an expense' do
    assert_equal @expense, @payment.expense
  end
end
