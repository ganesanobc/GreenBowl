class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.text :ingredients
      t.decimal :price
      t.integer :available
      t.belongs_to :kitchen, foreign_key: true

      t.timestamps
    end
  end
end
