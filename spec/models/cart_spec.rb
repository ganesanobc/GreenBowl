require 'rails_helper'

RSpec.describe Cart, type: :model do
  context "validations" do
    it { should define_enum_for(:state).with([:open, :closed, :archived]) }
  end
  context "associations" do
    it { should have_many(:orders) }
  end
end
