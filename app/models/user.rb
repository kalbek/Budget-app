class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # Include Devise modules for authentication and others as needed
  devise :database_authenticatable, :registerable, :recoverable,
         :rememberable, :validatable, :timeoutable,
         stretches: 13, # Cost of the hashing algorithm (default is 11)
         remember_for: 2.weeks, # Expiration period for the "remember me" feature (default is 2.weeks)
         timeout_in: 30.minutes # Period of inactivity before a user is automatically logged out (default is nil)

  validates :name, presence: true
  has_many :payments, foreign_key: :author_id
  has_many :expenses, foreign_key: :transaction_id
end
