FactoryBot.define do
  factory :admin do
    email "test_user@google.com"
    password "Abcd1234!"
    trait :as_manager do
      role { 'manager' }
    end
    trait :as_operator do
      role { 'operator' }
    end
    trait :as_siteadmin do
      role { 'siteadmin' }
    end
  end
end
