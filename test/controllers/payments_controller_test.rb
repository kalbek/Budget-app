require 'test_helper'

class PaymentsControllerTest < ActionController::TestCase
  include Devise::Test::ControllerHelpers # For testing with Devise authentication

  def setup
    @user = FactoryBot.create(:user)
    @expense = FactoryBot.create(:expense, user: @user)
    sign_in @user
  end

  test 'should get index' do
    get :index, params: { id: @expense.id }

    assert_response :success
    assert_template :index
    assert_not_nil assigns(:user)
    assert_not_nil assigns(:expense)
    assert_not_nil assigns(:payments)
  end

  test 'should get new' do
    get :new, params: { expense_id: @expense.id }

    assert_response :success
    assert_template :new
    assert_not_nil assigns(:expense)
    assert_not_nil assigns(:payment)
  end

  test 'should create payment' do
    assert_difference('Payment.count') do
      post :create, params: {
        expense_id: @expense.id,
        payment: { name: 'Payment Name', amount: 50 }
      }
    end

    assert_redirected_to payments_path(id: @expense.id)
    assert_equal 'Payment created successfully.', flash[:notice]
  end
end
