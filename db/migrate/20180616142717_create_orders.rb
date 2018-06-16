class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :quantity
      t.integer :state
      t.belongs_to :cart, foreign_key: true
      t.belongs_to :kitchen, foreign_key: true
      t.belongs_to :product, foreign_key: true

      t.timestamps
    end
  end
end
