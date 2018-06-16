FactoryBot.define do
  factory :customer do
    sequence(:email) { |n| "user#{n}@factory.com" }
    password { Faker::Internet.password }
  end
end
