require 'rails_helper'

RSpec.describe RestaurantManager, type: :model do
  context "validations" do
    it "with manager only" do
      expect(create(:restaurant_manager, :with_manager)).to be_valid
    end
    it "operator not allowed" do
      expect{ create(:restaurant_manager, :with_operator) }.to raise_error(ActiveRecord::RecordInvalid)
    end
    it "site admin not allowed" do
      expect{ create(:restaurant_manager, :with_siteamdin) }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end

  context "unqiueness" do
    it "duplicates not allowed" do
      rm = create(:restaurant_manager, :with_manager)
      dup = RestaurantManager.new(restaurant:rm.restaurant, manager:rm.manager)
      expect{ dup.save }.to raise_error(ActiveRecord::RecordNotUnique)
    end
  end
end
