require 'rails_helper'

RSpec.describe Order, type: :model do
  context "validations" do
    it { should define_enum_for(:state).with([:selected, :sent_to_kitchen, :prepared, :served]) }

    #Bug in rspec is preventing the following example
    xit { should validate_numericality_of(:quantity).is_greater_than(0) }
  end
  context "associations" do
    it { should have_one(:customer) }
  end
end
