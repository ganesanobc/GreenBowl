FactoryBot.define do
  factory :order do
    quantity 1
    state 1
    association :cart, factory: :cart
    association :kitchen, factory: :kitchen
    association :product, factory: :product
  end
end
