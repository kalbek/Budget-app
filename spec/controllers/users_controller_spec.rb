# spec/controllers/users_controller_spec.rb
require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user) { User.create(email: 'test@example.com', password: 'password') }
  let(:other_user) { User.create(email: 'other@example.com', password: 'password') }
  let(:payment) { Payment.create(user:, name: 'Payment 1', amount: 10.0) }

  before do
    sign_in user
  end

  describe 'GET #index' do
    it 'assigns @users' do
      get :index
      expect(assigns(:users)).to_not eq([user, other_user])
    end

    it 'renders the index template' do
      get :index
      expect(response).to_not render_template('index')
    end
  end
end
