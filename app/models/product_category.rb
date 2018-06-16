class ProductCategory < ApplicationRecord
  # relationships
  belongs_to :product
  belongs_to :category

  # validations
  
end
