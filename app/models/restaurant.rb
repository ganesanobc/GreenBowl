class Restaurant < ApplicationRecord

  # relationships
  has_and_belongs_to_many :managers,
    join_table: "restaurant_managers",
    association_foreign_key: "manager_id",
    class_name: "Admin",
    foreign_key: 'restaurant_id'
  has_many :kitchens
  has_many :carts

  # validations
  validates :brand, presence: true, uniqueness: {
    case_sensitive: false
  }
  validates :branch, presence: true, uniqueness: {
    case_sensitive: false,
    scope: :brand
  }

end
