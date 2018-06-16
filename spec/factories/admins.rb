require 'faker'

FactoryBot.define do
  factory :admin do
    sequence(:email) { |n| "user#{n}@factory.com" }
    password { Faker::Internet.password }
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
