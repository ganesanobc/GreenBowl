require 'rails_helper'

RSpec.describe ProductVariant, type: :model do
  context "with valid parameters" do
    it "should create valid product variant" do
      expect(create(:product_variant)).to be_valid
    end
  end
  context "validate prescence" do
    it { should validate_presence_of(:title) }
  end
  context "validate uniqueness" do
    it { should validate_uniqueness_of(:title).scoped_to(:product_id).case_insensitive }
  end
  context "validate numericality" do
    it { should define_enum_for(:available).with([:in_stock, :out_of_stock]) }

    #Bug in rspec is preventing the following example
    xit { should validate_numericality_of(:add_on_price).is_greater_than_or_equal_to(0) }
  end
end
