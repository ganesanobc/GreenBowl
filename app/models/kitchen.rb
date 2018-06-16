class Kitchen < ApplicationRecord
  # relationships
  belongs_to :restaurant
  has_many :products
  has_many :orders
  has_one :kitchen_operator
  has_one :operator, class_name: "Admin", through: :kitchen_operator

  # validations
  validates :name, presence: true, uniqueness: {
    case_sensitive: false,
    scope: :restaurant_id
  }
end
