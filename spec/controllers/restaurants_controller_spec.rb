require 'rails_helper'

RSpec.describe RestaurantsController, type: :controller do
  before(:all) do
    @restaurant = create(:restaurant)
    @customer = create (:customer)
  end

  before(:each) do
    visit restaurant_path(@restaurant)
    sign_in_as(@customer)
    @active_cart = controller.view_context.active_cart
  end

  context "when customer is signing in or accessing the restaurant page" do
    context "for the first time" do
      it "should create a new active cart" do
        expect(@customer.carts.open.count).to be_eql 1
      end
    end

    context "within 15 mins of last access" do
      it "should reuse the last active cart" do
        @active_cart.updated_at = Time.now - 14.minutes
        @active_cart.save(touch: false)

        visit restaurant_path(@restaurant)
        expect(controller.view_context.active_cart).to be_eql @active_cart
      end
    end

    context "after 15 mins of last access" do
      it "should create a new active cart" do
        @active_cart.updated_at = Time.now - 16.minutes
        @active_cart.save(touch: false)

        visit restaurant_path(@restaurant)
        expect(controller.view_context.active_cart).to_not be_eql @active_cart
      end

      it "should destroy the last active but expired cart if open" do
        @active_cart.updated_at = Time.now - 16.minutes
        @active_cart.save(touch: false)

        visit restaurant_path(@restaurant)
        # the previous test ensures that a new cart object is created,
        # so this test will test if the previous cart object that was open is
        # destroyed
        expect(@customer.carts.count).to be_eql 1
      end
    end
  end

  context "when customer adds products to the cart" do
    it "should increase the orders count if a new type of product is added"
    it "should not increase the orders count if the same product is added"
    it "should compute the total cost of the cart"
  end

end
