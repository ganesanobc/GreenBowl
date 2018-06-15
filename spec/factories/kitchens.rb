FactoryBot.define do
  factory :kitchen do
    name "MyString"
    description "MyText"
    restaurant { create(:restaurant) }
  end
end
