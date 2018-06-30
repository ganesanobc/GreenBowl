class Order < ApplicationRecord
  attr_accessor :sub_total_price
  after_save :update_sub_total_price
  after_initialize :update_sub_total_price

  # relationships
  belongs_to :cart
  belongs_to :kitchen
  belongs_to :product
  has_one :customer, through: :cart

  # validations
  enum state: [:selected, :sent_to_kitchen, :prepared, :served]
  validates :state, inclusion: { in: states.keys }

  def update_sub_total_price
    if self.product.nil?
      self.sub_total_price = 0
    else
      self.sub_total_price = self.quantity * self.product.price
    end
  end

end
