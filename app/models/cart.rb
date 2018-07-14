class Cart < ApplicationRecord
  attr_accessor :total_price
  after_save :update_total_price
  after_initialize :update_total_price

  # relationships
  belongs_to :restaurant
  belongs_to :customer
  has_many :orders, dependent: :delete_all

  # validations
  enum state: [:open, :closed, :archived]
  validates :state, inclusion: { in: states.keys }

  def update_total_price
    self.total_price = 0
    self.orders.each { |order| self.total_price += order.sub_total_price } unless self.orders.nil?
  end

end
