class AddUniquenessToProductCategories < ActiveRecord::Migration[5.2]
  def change
    add_index :product_categories, [:product_id, :category_id], :unique => true
  end
end
