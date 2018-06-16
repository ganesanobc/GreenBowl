require 'faker'

FactoryBot.define do
  factory :kitchen do
    sequence(:name) { |n| "#{Faker::Company.name} #{n}" }
    description { Faker::Company.buzzword }
    restaurant { create(:restaurant) }
  end
end
