class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.references :user, index:true, null: false, foreign_key: true
      t.integer :approved
      t.text :note_user
      t.text :note_admin
      t.datetime :date_start
      t.datetime :date_return

      t.timestamps
    end
  end
end
