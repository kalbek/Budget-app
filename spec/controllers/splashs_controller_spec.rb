require 'rails_helper'

RSpec.describe SplashController, type: :controller do
  describe 'GET #index' do
    context 'when user is signed in' do
      it 'redirects to expenses path' do
        user = create(:user) # Assuming you have a factory named :user
        sign_in user

        get :index

        expect(response).to redirect_to(expenses_path)
      end
    end

    context 'when user is not signed in' do
      it 'renders the index template' do
        get :index

        expect(response).to render_template(:index)
      end

      it 'does not assign @user if not signed in' do
        get :index

        expect(assigns(:user)).to be_nil
      end
    end
  end

  describe '#redirect_authenticated_user' do
    context 'when user is signed in' do
      before do
        user = create(:user)
        sign_in user
      end

      it 'redirects to expenses path' do
        user = create(:user)
        sign_in user

        expect(subject).to receive(:redirect_to).with(expenses_path)

        subject.send(:redirect_authenticated_user)
      end
    end
  end
end
