class ExpensesController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :verify_authenticity_token
  ICONS = %w[CHARITY ENTERTAINMENT GROCERY FITNESS RECREATIONAL TRAVEL].freeze
  
  def index
    @last_expense = Expense.last
    @user = current_user
    @expenses = Expense.order(created_at: :desc)
    @payments = Payment.all
  end

  def show
    @user = current_user
    @expenses = Expense.order(created_at: :desc)
    @expense = Expense.find(params[:id])
  end

  def new
    @expenses = Expense.order(created_at: :desc)
    @current_user = current_user
  end

  def create
    if expense_params[:name].present? && expense_params[:icon].present?
      @expense = Expense.new(expense_params[:expense])
      @expense.user_id = current_user.id
      @expense.created_at = Time.current
      @expense.updated_at = Time.current
      @expense.name = expense_params[:name]
      @expense.icon = expense_params[:icon]

      if @expense.save
        redirect_to expenses_path, notice: 'Transaction created successfully.'
      else
        flash.now[:alert] = @expense.errors.full_messages.join(', ')
        render :new
      end
    else
      @name_error = 'Name is required.' if expense_params[:name].blank?
      @icon_error = 'Icon is required.' if expense_params[:icon].blank?

      flash.now[:alert] = 'Both name and icon are required.'
      render :new
    end
  end

  private

  def expense_params
    params.require(:expense).permit(:name, :icon)
  end
end
