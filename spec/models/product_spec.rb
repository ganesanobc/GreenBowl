require 'rails_helper'

RSpec.describe Product, type: :model do
  context "with valid parameters" do
    it "should create valid product" do
      expect(create(:product)).to be_valid
    end
  end
  context "validate prescence" do
    it { should validate_presence_of(:title) }
  end
  context "validate uniqueness" do
    it { should validate_uniqueness_of(:title).scoped_to(:kitchen_id).case_insensitive }
  end
  context "validate numericality" do
    it { should define_enum_for(:available).with([:in_stock, :out_of_stock]) }

    #Bug in rspec is preventing the following example
    xit { should validate_numericality_of(:price).is_greater_than(0) }
  end
  context "associations" do
    it { should have_and_belong_to_many(:categories).join_table("product_categories") }
    it { should have_many(:product_variants) }
  end
end
