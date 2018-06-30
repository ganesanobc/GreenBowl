class OrdersController < ApplicationController
  def create
    # get the parent cart
    cart = Cart.find(order_params[:cart_id])
    if !cart.nil? && cart.open?
      # find if the product has already been added
      dup = find_duplicate(cart, order_params[:product_id])
      if dup.nil?
        # create a new order item if none exists
        @order = Order.selected.create!(order_params)
      else
        # just increase the quantity of existing order
        dup.update!( quantity: dup.quantity+1 )
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.permit(:quantity, :state, :kitchen_id, :product_id, :cart_id)
    end

    # find an order with the same product id
    def find_duplicate(cart, product_id)
      cart.orders.find_by_product_id(product_id)
    end
end
