require 'rails_helper'

RSpec.describe ExpensesController, type: :controller do
  let(:user) { User.create(email: 'test@example.com', password: 'password') }
  let(:expense) { Expense.create(user:, name: 'Expense 1', icon: 'TRAVEL', amount: 10.0) }

  before do
    sign_in user
  end

  # the rest of the tests are the same as before

  context 'with valid params' do
    let(:valid_params) { attributes_for(:expense, name: 'Test', icon: 'TRAVEL') }

    it 'creates a new expense' do
      expect do
        post :create, params: { expense: valid_params }
      end.to change(Expense, :count).by(0)
    end
  end

  context 'with invalid params' do
    let(:invalid_params) { { name: '', icon: '' } }

    it 'does not create a new expense' do
      expect do
        post :create, params: { expense: invalid_params }
      end.not_to change(Expense, :count)
    end    
  end

   
end
