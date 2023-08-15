# test/factories/foods.rb
FactoryBot.define do
  factory :recipe do
    name { 'Recipe Name' }
    description { 'nice one' }
    public { false }
  end
end
