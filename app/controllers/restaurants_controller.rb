class RestaurantsController < ApplicationController
  before_action :authenticate_customer!
  before_action :set_restaurant

  # GET /restaurants/1
  def show
    @categories = @restaurant.categories
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_restaurant
      @restaurant = Restaurant.find(params[:id])
    end

end
