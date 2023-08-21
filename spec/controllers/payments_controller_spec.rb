require 'rails_helper'

RSpec.describe ExpensesController, type: :controller do
  let(:user) { create(:user) }
  let(:expense) { create(:expense, user:) }

  before do
    sign_in(user)
  end

  describe 'POST #create' do
    context 'with valid params' do
      let(:valid_params) { { name: 'Test', icon: 'TRAVEL' } }

      it 'creates a new expense' do
        expect do
          post :create, params: { expense: valid_params }
        end.to change(Expense, :count).by(1)
      end

      it 'redirects to expenses_path' do
        post :create, params: { expense: valid_params }
        expect(response).to redirect_to(expenses_path)
      end
    end

    context 'with invalid params' do
      let(:invalid_params) { { name: '', icon: '' } }

      it 'does not create a new expense' do
        expect do
          post :create, params: { expense: invalid_params }
        end.not_to change(Expense, :count)
      end

      it 'renders the new template' do
        post :create, params: { expense: invalid_params }
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'GET #index' do
    it 'returns a success response' do
      get :index
      expect(response).to have_http_status(:success)
    end

    it 'assigns the user' do
      get :index
      expect(assigns(:user)).to eq(user)
    end
  end
end
