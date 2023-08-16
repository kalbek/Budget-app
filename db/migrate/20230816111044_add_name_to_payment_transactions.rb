class AddNameToPaymentTransactions < ActiveRecord::Migration[7.0]
  def change
    add_column :payment_transactions, :name, :string
  end
end
