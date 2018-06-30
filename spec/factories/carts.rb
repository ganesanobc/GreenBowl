FactoryBot.define do
  factory :cart do
    state "open"
    restaurant { create(:restaurant) }
    customer { create(:customer) }
  end
end
