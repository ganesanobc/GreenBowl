FactoryBot.define do
  factory :product_variant do
    sequence(:title) { |n| "#{Faker::Food.dish} #{n}" }
    description { Faker::Food.dish }
    add_on_price "9.99"
    available "in_stock"
    product { create(:product) }
  end
end
