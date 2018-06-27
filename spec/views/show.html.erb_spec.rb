require 'rails_helper'

RSpec.describe "restaurants/show.html.erb", type: :view do
  before(:all) do
    @restaurant = create(:restaurant)

    # create a kitchen
    kitchen = create(:kitchen, restaurant: @restaurant)

    # create the food categories
    @category1 = create(:category, restaurant: @restaurant)
    @category2 = create(:category, restaurant: @restaurant)

    # create the dishes for the kitchen
    @dish1 = create(:product, kitchen: kitchen)
    @dish2 = create(:product, kitchen: kitchen)
    @dish3 = create(:product, available: "out_of_stock", kitchen: kitchen)

    # assign category 1 to the dishes
    create(:product_category, product: @dish1, category: @category1)
    create(:product_category, product: @dish2, category: @category1)
    create(:product_category, product: @dish3, category: @category2)
  end

  context "when a visiting a restaurant's page" do
    it "should have brand and branch of the restaurant" do
      assign(:restaurant, @restaurant)
      render

      expect(rendered).to have_content @restaurant.brand
      expect(rendered).to have_content @restaurant.brand
    end

    it "should display all available products in the restaurant" do

      assign(:products, @restaurant.products)
      assign(:categories, @restaurant.categories)
      render

      # should show dish 1
      expect(rendered).to have_content @dish1.title
      expect(rendered).to have_content "$ #{@dish1.price}"

      # should show dish 2
      expect(rendered).to have_content @dish2.title
      expect(rendered).to have_content "$ #{@dish2.price}"

      # should not show dish 3
      expect(rendered).to_not have_content @dish3.title
    end

    it "should display only categories with at least 1 available product" do

      assign(:products, @restaurant.products)
      assign(:categories, @restaurant.categories)
      render

      # should show category 1
      expect(rendered).to have_content @category1.title

      # should not show category 2 since it has no dishes
      expect(rendered).to_not have_content @category2.title
    end
  end

end
