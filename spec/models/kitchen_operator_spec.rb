require 'rails_helper'

RSpec.describe KitchenOperator, type: :model do
  context "validations" do
    it "with operator only" do
      expect(create(:kitchen_operator, :with_operator)).to be_valid
    end
    it "manager not allowed" do
      expect{ create(:kitchen_operator, :with_manager) }.to raise_error(ActiveRecord::RecordInvalid)
    end
    it "site admin not allowed" do
      expect{ create(:kitchen_operator, :with_siteamdin) }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
end
