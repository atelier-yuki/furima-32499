class CreateDeliveryDestinations < ActiveRecord::Migration[6.0]
  def change
    create_table :delivery_destinations do |t|
      t.string :post_num ,null: false
      t.integer :address_id ,null: false
      t.string :city ,null: false
      t.string :block ,null: false
      t.string :building
      t.string :tell ,null: false
      t.references :purchase, null: false, foreign_key: true
      t.timestamps
    end
  end
end
