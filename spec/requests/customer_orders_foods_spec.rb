require 'rails_helper'

RSpec.describe "CustomerOrdersFoods", type: :request do
  describe "Workflow: customer orders foods" do
    before(:all) do
      @restaurant = create(:restaurant)
    end

    context "when customer is not signed in" do
      before do
        visit restaurant_path(@restaurant)
      end
      it "should be redirected to the sign in page" do
        expect(page).to have_current_path(new_customer_session_path)
      end
    end

    context "when customer is signed in" do
      before do
        customer = create(:customer)
        sign_in customer
        visit restaurant_path(@restaurant)
      end

      it "should be at the restaurant page" do
        expect(page).to have_current_path(restaurant_path(@restaurant))
      end

      # it "should have a title with the restaurant's brand" do
      #   expect(page).to have_title("#{@restaurant.brand} | GreenBowl")
      # end
      #
      # it "should the restaurant's brand and branch on the page clearly" do
      #   expect(page.first('div#brand').native.inner_html).to be_eql @restaurant.brand
      #   expect(page.first('div#branch').native.inner_html).to be_eql @restaurant.branch
      # end

    end

  end
end
