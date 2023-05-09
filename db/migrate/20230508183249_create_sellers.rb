class CreateSellers < ActiveRecord::Migration[7.0]
  def change
    create_table :sellers do |t|
      t.string :company_name
      t.string :location
      t.string :contact
      t.string :email
      t.string :password_digest
      t.string :subscription_package
      t.string :role, default: "seller", null: false
      t.string :avatar

      t.timestamps
    end
  end
end
