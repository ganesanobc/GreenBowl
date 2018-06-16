require 'rails_helper'

RSpec.describe ProductCategory, type: :model do
  context "product category association" do
    before(:all) do
      @pc = create(:product_category)
    end
    it "should be valid if unique" do
      expect(@pc).to be_valid
    end

    it "should not be valid if it is a duplicate" do
      dup = ProductCategory.new(product:@pc.product, category:@pc.category)
      expect{ dup.save }.to raise_error(ActiveRecord::RecordNotUnique)
    end
  end
end
