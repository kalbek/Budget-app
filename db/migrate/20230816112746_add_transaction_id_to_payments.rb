class AddTransactionIdToPayments < ActiveRecord::Migration[7.0]
  def change
    add_column :payments, :transaction_id, :integer
    add_foreign_key :payments, :payment_transactions, column: :transaction_id
  end
end
