class RestaurantsController < ApplicationController
  before_action :authenticate_customer!
  before_action :set_restaurant, only: [:show]

  # GET /restaurants/1
  def show
    # get the current active cart or a new one for the customer
    @cart = validate_active_cart

    # return the categories (and the corresponding products)
    @categories = @restaurant.categories
  end

  protected
    def active_cart
      cart = current_customer.carts.open.first ||
        current_customer.carts.open.create!(restaurant:@restaurant)
      cart
    end

    helper_method :active_cart

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_restaurant
      @restaurant = Restaurant.find(params[:id])
    end

    def validate_active_cart
      # get the last used cart for current customer
      cart = active_cart

      # check if the active cart has expired
      if Time.now > cart.updated_at + 15.minutes
        # cart has expired, so destroy it
        cart.destroy!

        # create a new cart
        cart = current_customer.carts.open.create!(restaurant:@restaurant)
      end

      cart
    end
end
