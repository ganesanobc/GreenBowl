require 'rails_helper'

RSpec.describe Admin, type: :model do
  context "validations" do
    it do
      should define_enum_for(:role).with([:manager, :operator, :siteadmin])
    end
  end
  context "associations" do
    it { should have_and_belong_to_many(:restaurants).join_table("restaurant_managers") }
    it { should have_one(:kitchen) }
    it { should have_one(:kitchen_operator) }
  end
end
