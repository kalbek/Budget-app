class Expense < ApplicationRecord
  belongs_to :user
  belongs_to :payment

  validates :name, presence: true
end
