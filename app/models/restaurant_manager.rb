class RestaurantManager < ApplicationRecord
  # relationships
  belongs_to :restaurant
  belongs_to :manager, class_name: "Admin"

  # validations
  validate :only_manager_allowed

  private
    def only_manager_allowed
      unless self.manager.manager?
        errors.add(:manager, "does not have a Manager role")
      end
    end
end
