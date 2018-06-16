class Cart < ApplicationRecord
  # relationships
  belongs_to :restaurant
  belongs_to :customer
  has_many :orders

  # validations
  enum state: [:open, :closed, :archived]
  validates :state, inclusion: { in: states.keys }
end
