class CreateDeliveries < ActiveRecord::Migration[6.0]
  def change
    create_table :deliveries do |t|
      t.string :postal_code, null: false
      t.integer :prefecture_id, null: false
      t.string :citys, null: false
      t.string :address, null: false
      t.string :building_name
      t.string :phone, null: false
      t.references :order, null: false, foreugn_key: true

      t.timestamps
    end
  end
end
