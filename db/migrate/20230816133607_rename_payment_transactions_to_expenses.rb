class RenamePaymentTransactionsToExpenses < ActiveRecord::Migration[6.0]
  def change
    rename_table :payment_transactions, :expenses
  end
end
