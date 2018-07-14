require 'rails_helper'

RSpec.describe OrdersController, type: :controller do
  before(:all) do
    @cart = create(:cart)
    kitchen = create(:kitchen)
    dish1 = create(:product, kitchen: kitchen)
    dish2 = create(:product, kitchen: kitchen)
    @order1_attributes = {
      cart_id: @cart.id,
      product_id: dish1.id,
      kitchen_id: kitchen.id,
      quantity: 1,
      state: "selected"
    }
    @order2_attributes = {
      cart_id: @cart.id,
      product_id: dish2.id,
      kitchen_id: kitchen.id,
      quantity: 1,
      state: "selected"
    }
    @sub_total_price = dish1.price * 2
  end

  before(:each) do
    post :create, params: @order1_attributes
  end

  context "when customer adds products to the cart" do
    it "should increase the orders count if a new type of product is added" do
      expect {
        post :create, params: @order2_attributes
      }.to change(@cart.orders, :count).by(1)
      @cart.reload
    end
    it "should not increase the orders count if the same product is added" do
      expect {
        post :create, params: @order1_attributes
      }.to change(@cart.orders, :count).by(0)
      @cart.reload

      expect(@cart.orders.first.quantity).to be_eql 2
    end
    it "should compute the total cost of all the items in the order" do
      post :create, params: @order1_attributes
      @cart.reload
      expect(@cart.orders.first.sub_total_price).to be_eql @sub_total_price
    end
  end
end
