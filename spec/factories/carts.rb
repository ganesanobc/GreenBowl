FactoryBot.define do
  factory :cart do
    state 1
    restaurant { create(:restaurant) }
    customer { create(:customer) }
  end
end
