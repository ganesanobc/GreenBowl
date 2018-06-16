FactoryBot.define do
  factory :product_category do
    product { create(:product) }
    category { create(:category) }
  end
end
