class OrdersController < ApplicationController
  def create
    cart = Cart.find(order_params[:cart_id])
    @order_item = Order.selected.create!(order_params) if !cart.nil? && cart.open?
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.permit(:quantity, :state, :kitchen_id, :product_id, :cart_id)
      #params.require(:order).permit(:quantity, :state, :kitchen_id, :product_id, :cart_id)
    end
end
