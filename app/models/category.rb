class Category < ApplicationRecord
  # relationships
  belongs_to :restaurant
  has_and_belongs_to_many :products, join_table: "product_categories"

  # validations
  validates :title, presence: true, uniqueness: {
    case_sensitive: false,
    scope: :restaurant_id
  }
end
