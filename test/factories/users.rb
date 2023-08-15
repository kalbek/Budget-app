# test/factories/users.rb
FactoryBot.define do
  factory :user do
    name { 'User Name' }
    sequence(:email) { |n| "user#{n}@example.com" }
    password { 'password' }
    # Other attributes
  end
end
