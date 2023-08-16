class PaymentsController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @expense = Expense.find(params[:id])
    @payments = Payment.order(created_at: :desc)
  end

  def show
    @user = current_user
    @expenses = Expense.order(created_at: :desc)
    @expense = Expense.find(params[:id])
    @payments = @expense.payments
  end
  

  def new
    # @payment = current_user.payments.build
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
    params.require(:payment).permit(:name, :amount, :payment_transaction_id)
  end
end
