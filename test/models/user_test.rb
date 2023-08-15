# test/models/user_test.rb
require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = FactoryBot.create(:user)
  end

  test 'should be valid' do
    assert @user.valid?
  end

  test 'should not be valid without a name' do
    @user.name = nil
    assert_not @user.valid?
  end

  test 'admin? should return true if the user is an admin' do
    @user.role = 'admin'
    assert @user.admin?
  end

  test 'admin? should return false if the user is not an admin' do
    @user.role = 'user'
    assert_not @user.admin?
  end
end
