FactoryBot.define do
  factory :kitchen_operator do
    kitchen { create(:kitchen) }
    trait :with_manager do
      operator { create(:admin, :as_manager) }
    end
    trait :with_operator do
      operator { create(:admin, :as_operator) }
    end
    trait :with_siteamdin do
      operator { create(:admin, :as_siteadmin) }
    end
  end
end
