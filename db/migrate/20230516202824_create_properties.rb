class CreateProperties < ActiveRecord::Migration[7.0]
  def change
    create_table :properties do |t|
      t.string :location
      t.decimal :price
      t.integer :seller_id
      t.integer :buyer_id
      t.string :status
      t.string :property_type
      t.string :image
      t.text :description
      t.integer :size_in_sqft

      t.timestamps
    end
  end
end
