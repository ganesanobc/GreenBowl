class Order < ApplicationRecord
  # relationships
  belongs_to :cart
  belongs_to :kitchen
  belongs_to :product
  has_one :customer, through: :cart 

  # validations
  enum state: [:selected, :sent_to_kitchen, :prepared, :served]
  validates :state, inclusion: { in: states.keys }
end
