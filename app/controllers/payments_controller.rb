class PaymentsController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
  end

  def show
    @user = User.find(params[:user_id])
    render json: @user.entities.find(params[:id])
  end

  def new
    @payment = current_user.entities.build
    @current_user = current_user
  end

  def create
    @payment = current_user.entities.build(payment_params)

    if @payment.save
      redirect_to entities_path(@payment.user, @payment), notice: 'payment created successfully.'
    else
      flash.now[:alert] = @payment.errors.full_messages.join(', ')
    end
  end

  def destroy
    @food = payment.find(params[:id])
    authorize! :destroy, @payment
    @payment.destroy
    redirect_to entities_path, notice: 'payment successfully deleted.'
  end

  private

  def payment_params
    params.require(:payment).permit(:name, :amount)
  end
end
