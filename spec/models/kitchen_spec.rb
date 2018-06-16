require 'rails_helper'

RSpec.describe Kitchen, type: :model do
  context "with valid parameters" do
    it "should create valid kitchen" do
      expect(create(:kitchen)).to be_valid
    end
  end
  context "validate prescence" do
    it { should validate_presence_of(:name) }
  end
  context "validate uniqueness" do
    it { should validate_uniqueness_of(:name).scoped_to(:restaurant_id).case_insensitive }
  end
  context "associations" do
    it { should have_one(:kitchen_operator) }
    it { should have_one(:operator) }
    it { should have_many(:products) }
    it { should have_many(:orders) }
  end
end
