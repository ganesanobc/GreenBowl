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
end
