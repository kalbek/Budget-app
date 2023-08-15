# test/factories/foods.rb
FactoryBot.define do
  factory :food do
    name { 'Food Name' }
    quantity { 10 }
    measurement_unit { 10 }
    price { 10 }
    # Other attributes
    association :user # Creates an associated user
  end
end
