require 'rails_helper'

RSpec.describe Category, type: :model do
  context "with valid parameters" do
    it "should create valid category" do
      expect(create(:category)).to be_valid
    end
  end
  context "validate prescence" do
    it { should validate_presence_of(:title) }
  end
  context "validate uniqueness" do
    it { should validate_uniqueness_of(:title).scoped_to(:restaurant_id).case_insensitive }
  end
  context "associations" do
    it { should have_and_belong_to_many(:products).join_table("product_categories") }
  end
end
