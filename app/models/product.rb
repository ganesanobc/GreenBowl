class Product < ApplicationRecord
  # relationships
  belongs_to :kitchen
  has_many :product_variants
  has_and_belongs_to_many :categories, join_table: "product_categories"
  has_one_attached :image

  # validations
  validates :title, presence: true, uniqueness: {
    case_sensitive: false,
    scope: :kitchen_id
  }
  enum available: [:in_stock, :out_of_stock]
  validates :available, inclusion: { in: availables.keys }
  validates_numericality_of :price, greater_than: 0.0
end
