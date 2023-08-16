class Payment < ApplicationRecord
  belongs_to :user
  belongs_to :expense, class_name: 'Expense', foreign_key: 'transaction_id'

  validates :name, presence: true
  validates :amount, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
