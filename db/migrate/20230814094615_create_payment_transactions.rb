class CreatePaymentTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :payment_transactions do |t|
      t.references :user, foreign_key: { to_table: :users }
      t.string :name
      t.string :icon

      t.timestamps
    end
  end
end
