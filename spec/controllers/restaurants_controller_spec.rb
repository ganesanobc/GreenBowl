require 'rails_helper'

RSpec.describe RestaurantsController, type: :controller do
  # before(:all) do
  #   @restaurant = create(:restaurant)
  # end
  # context "when customer is signed in" do
  #   before do
  #     customer = create(:customer)
  #     sign_in customer
  #     visit restaurant_path(@restaurant)
  #   end
  #   it { should respond_with :ok }
  #   it { should render_with_layout('application') }
  #   it { should render_template :show }
  # end
  #
  # context "when customer is not signed in" do
  #   before do
  #     visit restaurant_path(@restaurant)
  #   end
  #   it { should redirect_to new_customer_session_path }
  #   it { should set_flash[:alert].to('You need to sign in or sign up before continuing.') }
  #   #it { should set_session[:return_to].to(restaurant_path) }
  # end
end
