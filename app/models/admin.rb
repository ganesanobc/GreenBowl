class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # relationships
  has_and_belongs_to_many :restaurants,
    join_table: "restaurant_managers",
    association_foreign_key: "restaurant_id",
    foreign_key: 'manager_id'
  has_one :kitchen_operator, foreign_key: 'operator_id'
  has_one :kitchen, through: :kitchen_operator

  # validations
  enum role: [:manager, :operator, :siteadmin]
  validates :role, inclusion: { in: roles.keys }

end
