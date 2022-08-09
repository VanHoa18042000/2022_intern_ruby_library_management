class CreateOrderDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :order_details do |t|
      t.references :order, null: false, foreign_key: true
      t.references :book, null: false, foreign_key: true
      t.integer :status
      t.integer :quantity
      t.integer :quantity_real

      t.timestamps
    end
  end
end
