class ProductVariant < ApplicationRecord
  # relationships
  belongs_to :product
  has_one_attached :image

  # validations
  validates :title, presence: true, uniqueness: {
    case_sensitive: false,
    scope: :product_id
  }
  enum available: [:in_stock, :out_of_stock]
  validates :available, inclusion: { in: availables.keys }
  validates_numericality_of :add_on_price, greater_than_or_equal_to: 0.0
end
