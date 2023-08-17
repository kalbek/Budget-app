class Expense < ApplicationRecord
  belongs_to :user
  belongs_to :payment, dependent: :destroy

  validates :name, presence: true
end
