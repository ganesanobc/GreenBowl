require 'faker'

FactoryBot.define do
  factory :product do
    sequence(:title) { |n| "#{Faker::Food.dish} #{n}" }
    description { Faker::Food.dish }
    ingredients { Faker::Food.dish }
    price "9.99"
    available "in_stock"
    kitchen { create(:kitchen) }
  end
end
