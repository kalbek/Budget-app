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
    @expense = Expense.find(params[:expense_id])
    @payment = Payment.new
  end

  def create
    @expense = Expense.find(params[:expense_id])
    @payment = Payment.new(payment_params)
    @payment.transaction_id = @expense.id
    @payment.created_at = Time.now
    @payment.updated_at = Time.now
    @payment.author_id = current_user.id

    if @payment.save
      redirect_to payments_path(id: @expense.id), notice: 'Payment created successfully.'
    else
      flash.now[:alert] = @payment.errors.full_messages.join(', ')
      puts @payment.errors.full_messages.join(', ')

      render :new
    end
  end

  private

  def payment_params
    params.require(:payment).permit(:name, :amount, :payment_transaction_id)
  end
end
