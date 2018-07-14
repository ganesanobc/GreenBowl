require 'rails_helper'

RSpec.describe "CustomerOrdersFoods", type: :request do
  describe "Workflow: customer orders foods" do
    before(:all) do
      @restaurant = create(:restaurant)

      # create a kitchen
      kitchen = create(:kitchen, restaurant: @restaurant)

      # create the food categories
      @category1 = create(:category, restaurant: @restaurant)

      # create the dishes for the kitchen
      @dish1 = create(:product, kitchen: kitchen)
      @dish1.reload

      # assign category 1 to the dishes
      create(:product_category, product: @dish1, category: @category1)
      @restaurant.reload

      # create the cart
      @customer = create(:customer)
      @cart = create(:cart, restaurant: @restaurant, customer: @customer, state: "open")

      # create orders
      @order1 = create(:order, cart:@cart, product: @dish1, kitchen: kitchen, customer: @customer)
      @cart.reload
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

    context "when customer reduces the quantity of an order in the cart" do
      before do
        sign_in @customer
        visit restaurant_path(@restaurant)
      end

      it "should update the quantity of the order if quantity is more than 0" do
        expect(page).to_not have_content "#{@dish1.title} $ #{@dish1.price} x 2 ="
        click_button "+"
        expect(page).to have_content "#{@dish1.title} $ #{@dish1.price} x 2 ="
      end
      it "should ask to delete the order from the cart if quantity is 1" do
        click_button "+"
        click_button "-"
        expect(page).to have_content "#{@dish1.title} $ #{@dish1.price} x 1 ="
      end
      xit "should ask to delete the order from the cart if quantity is 0" do
        click_button "-"
        accept_prompt do
          click_link('OK')
        end
        expect(page).to_not have_content "#{@dish1.title} $ #{@dish1.price} x"
      end
    end

  end
end
