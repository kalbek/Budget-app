# test/factories/foods.rb
FactoryBot.define do
  factory :payment do
    name { 'Payment Name' }
    amount { 10 }
    association :author, factory: :user
    association :expense
  end
end
