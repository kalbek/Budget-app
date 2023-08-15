class SplashController < ActionController::Base
    before_action :redirect_authenticated_user, if: :user_signed_in?
    def after_sign_out_path_for(resource_or_scope)
      splash_path
    end
    def redirect_authenticated_user
      redirect_to transactions_path
    end
    def index
      @user = current_user
    end
  end
  