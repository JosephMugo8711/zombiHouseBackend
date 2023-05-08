class CreateProperties < ActiveRecord::Migration[7.0]
  def change
    create_table :properties do |t|
      t.string :location
      t.decimal :price
      t.references :seller, null: false, foreign_key: true
      t.string :status
      t.string :property_type
      t.text :description
      t.integer :size_in_sqft

      t.timestamps
    end
  end
end
