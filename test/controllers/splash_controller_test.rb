require 'test_helper'

class SplashControllerTest < ActionController::TestCase
  include Devise::Test::ControllerHelpers  # For testing with Devise authentication

  test 'should redirect authenticated user to expenses_path' do
    user = FactoryBot.create(:user)
    sign_in user

    get :index

    assert_redirected_to expenses_path
  end

  test 'should show index for non-authenticated user' do
    get :index

    assert_response :success
    assert_template :index
    assert_nil assigns(:user)  # Ensure that @user is not assigned for non-authenticated users
  end
end
