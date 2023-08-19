# test/factories/foods.rb
FactoryBot.define do
  factory :expense do
    name { 'Expense Name' }
    icon { 'GROCERY.png' }
    association :user # Creates an associated user

  end
end
