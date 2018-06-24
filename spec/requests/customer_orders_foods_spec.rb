require 'rails_helper'

RSpec.describe "CustomerOrdersFoods", type: :request do
  describe "Workflow: customer orders foods" do
    before(:all) do
      @restaurant = create(:restaurant)
    end

    context "if customer is not signed in" do
      before do
        visit restaurant_path(@restaurant)
      end
      it "should be redirected to the sign in page" do
        expect(page).to have_current_path(new_customer_session_path)
      end
    end

    context "if customer is signed in" do
      before do
        @customer = create(:customer)
        sign_in @customer
        visit restaurant_path(@restaurant)
      end

      it "should be at the restaurant page" do
        expect(page).to have_current_path(restaurant_path(@restaurant))
      end

      it "should have a title with the restaurant's brand" do
        expect(page).to have_title("#{@restaurant.brand} | GreenBowl")
      end

      it "customer should have a new cart" do
        expect(@customer.carts.count).to be > 0
      end

    end

  end
end
