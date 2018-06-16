require 'faker'

FactoryBot.define do
  factory :restaurant do
    sequence(:brand) { |n| "#{Faker::Company.name} #{n}" }
    sequence(:branch) { |n| "#{Faker::Company.suffix} #{n}" }
    description { Faker::Company.buzzword }
  end
end
