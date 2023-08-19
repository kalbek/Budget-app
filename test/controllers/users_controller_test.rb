require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  include Devise::Test::ControllerHelpers # For testing with Devise authentication

  def setup
    @user = FactoryBot.create(:user)
    sign_in @user # Sign in the user using Devise authentication
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test 'should get show' do
    get :show, params: { id: @user.id }
    assert_response :success
    assert_not_nil assigns(:user)
  end
end
