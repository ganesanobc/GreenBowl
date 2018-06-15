class CreateKitchenOperators < ActiveRecord::Migration[5.2]
  def change
    create_table :kitchen_operators do |t|
      t.belongs_to :kitchen, foreign_key: true
      t.belongs_to :operator, foreign_key: { to_table: :admins }

      t.timestamps
    end
  end
end
