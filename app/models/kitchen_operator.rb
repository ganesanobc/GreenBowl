class KitchenOperator < ApplicationRecord
  # relationships
  belongs_to :kitchen
  belongs_to :operator, class_name: "Admin"

  # validations
  validate :only_operator_allowed

  private
    def only_operator_allowed
      unless self.operator.operator?
        errors.add(:operator, "does not have a Operator role")
      end
    end
end
