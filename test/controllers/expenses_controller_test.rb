require 'test_helper'

class ExpensesControllerTest < ActionController::TestCase
  include Devise::Test::ControllerHelpers # For testing with Devise authentication

  def setup
    @user = FactoryBot.create(:user)
    sign_in @user
  end

  test 'should get index' do
    get :index

    assert_response :success
    assert_template :index
    assert_not_nil assigns(:user)
    assert_not_nil assigns(:last_expense)
    assert_not_nil assigns(:expenses)
    assert_not_nil assigns(:payments)
  end

  test 'should get new' do
    get :new

    assert_response :success
    assert_template :new
    assert_not_nil assigns(:expenses)
    assert_not_nil assigns(:current_user)
  end

  test 'should create expense' do
    assert_difference('Expense.count') do
      post :create, params: { expense: { name: 'Expense Name', icon: 'GROCERY.png' } }
    end

    assert_redirected_to expenses_path
    assert_equal 'Transaction created successfully.', flash[:notice]
  end

  test 'should not create expense with missing name or icon' do
    post :create, params: { expense: { name: '', icon: 'GROCERY.png' } }

    assert_response :success
    assert_template :new
    assert_not_nil assigns(:name_error)
    assert_nil assigns(:icon_error)
    assert_equal 'Name is required.', assigns(:name_error)
    assert_nil flash[:notice]
  end
end
