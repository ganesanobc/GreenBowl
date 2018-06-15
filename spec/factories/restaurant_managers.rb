FactoryBot.define do
  factory :restaurant_manager do
    restaurant { create(:restaurant) }
    trait :with_manager do
      manager { create(:admin, :as_manager) }
    end
    trait :with_operator do
      manager { create(:admin, :as_operator) }
    end
    trait :with_siteamdin do
      manager { create(:admin, :as_siteadmin) }
    end
  end
end
