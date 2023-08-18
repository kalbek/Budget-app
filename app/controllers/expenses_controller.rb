class ExpensesController < ApplicationController
  before_action :authenticate_user!
  ICONS = %w[Charity Entertainment Grocery Fitness Recreational Travel].freeze
  def index
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
    # @expenses = current_user.payments.build
    @expenses = Expense.order(created_at: :desc)
    @current_user = current_user
  end

  def create
    puts "expenssssssssssssssssssssssssss: #{expense_params}"

    @expense = Expense.new(expense_params)
    puts "expenssssssssssssssssssssssssss: #{@expense}"
    @expense.user_id = current_user.id
    @expense.created_at = Time.current
    @expense.updated_at = Time.current
    puts "expenssssssssssssssssssssssssss:name: #{@expense.name}"
    puts "expenssssssssssssssssssssssssss:icon: #{@expense.icon}"
    puts "ppppppppppppppppppppppppppppp: #{@expense.errors.full_messages.join(', ')}"
    puts "expense paramsssisiiiiiiiiii: #{expense_params.inspect}"

    if @expense.save
      redirect_to expenses_path, notice: 'transaction created successfully.'
    else
      binding.pry
      flash.now[:alert] = @expense.errors.full_messages.join(', ')
      render :new
    end
  end

  def destroy
    @transaction = transaction.find(params[:id])
    authorize! :destroy, @transaction
    @recipe.destroy
    redirect_to transactions_path, notice: 'transaction was successfully deleted.'
  end

  private

  def expense_params
    params.require(:expense).permit(:name, :icon)
  end
  
end
