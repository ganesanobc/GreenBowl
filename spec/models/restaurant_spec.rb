require 'rails_helper'

RSpec.describe Restaurant, type: :model do
  context "with valid parameters" do
    it "should create valid restaurant" do
      expect(create(:restaurant)).to be_valid
    end
  end
  context "validate prescence" do
    it { should validate_presence_of(:brand) }
    it { should validate_presence_of(:branch) }
  end
  context "validate uniqueness" do
    it { should validate_uniqueness_of(:brand).case_insensitive }
    it { should validate_uniqueness_of(:branch).scoped_to(:brand).case_insensitive }
  end
  context "associations" do
    it { should have_and_belong_to_many(:managers).join_table("restaurant_managers") }
    it { should have_many(:kitchens) }
    it { should have_many(:carts) }
    it { should have_many(:categories) }
    it { should have_many(:products) }
  end
end
