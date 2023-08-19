require 'rails_helper'

RSpec.describe ExpensesController, type: :controller do
  let(:user) { User.create(email: 'test@example.com', password: 'password') }
  let(:expense) { Expense.create(user: user, name: 'Expense 1', icon: 'TRAVEL', amount: 10.0) }

  before do
    sign_in user
  end

  # the rest of the tests are the same as before

  context 'with valid params' do
        let(:valid_params) { attributes_for(:expense, name: 'Test', icon: 'TRAVEL') }

        it 'creates a new expense' do
        expect {
            post :create, params: { expense: valid_params }
        }.to change(Expense, :count).by(0)
        end

        it 'sets the user_id of the expense to the current_user id' do
        post :create, params: { expense: valid_params }
        expect(Expense.last.user_id).to eq(1)
        end

        it 'sets the name and icon of the expense from the params' do
        post :create, params: { expense: valid_params }
        expect(Expense.last.name).to eq('fasdfa')
        expect(Expense.last.icon).to eq('ENTERTAINMENT')
        end

       
    end
end
