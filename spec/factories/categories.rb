require 'faker'

FactoryBot.define do
  factory :category do
    sequence(:title) { |n| "#{Faker::Cat.name} #{n}" }
    restaurant { create(:restaurant) }
  end
end
