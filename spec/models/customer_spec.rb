require 'rails_helper'

RSpec.describe Customer, type: :model do
  context "associations" do
    it { should have_many(:carts) }
  end
end
