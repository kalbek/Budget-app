class UsersController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :verify_authenticity_token

  def index
    @users = User.includes(:payments).all
  end

  def show
    @user = User.includes(:payments).find(params[:id])
    @users = User.all
  end
end
