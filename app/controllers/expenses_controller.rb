class ExpensesController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @expenses = Expense.order(created_at: :desc)
    @payments = Payment.all
  end

  def show
    @user = current_user
    @expenses = Expense.order(created_at: :desc)
    @expense = Expense.find(params[:id])
    @payments = @expense.payments
  end

  def new
    # @expenses = current_user.payments.build
    @expenses = Expense.order(created_at: :desc)
    @current_user = current_user
  end

  def create
    @transaction = current_user.transactions.build(transaction_params)
    @transaction.created_at ||= Time.current

    if @transaction.save
      redirect_to user_recipes_path(@transaction.user, @payments), notice: 'transaction created successfully.'
    else
      flash.now[:alert] = @transaction.errors.full_messages.join(', ')
    end
  end

  def update
    @transaction = transaction.find(params[:id])
    if @transaction.update(transaction_params)
      redirect_to user_recipe_path(id: @transaction.id)
    else
      render :edit
    end
  end

  def destroy
    @transaction = transaction.find(params[:id])
    authorize! :destroy, @transaction
    @recipe.destroy
    redirect_to transactions_path, notice: 'transaction was successfully deleted.'
  end

  private

  def transaction_params
    params.require(:recipe).permit(:name, :icon, :created_at)
  end
end
