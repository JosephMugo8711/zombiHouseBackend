class CreateBuyers < ActiveRecord::Migration[7.0]
  def change
    create_table :buyers do |t|
      t.string :username
      t.string :fullname
      t.string :email
      t.string :contact
      t.integer :budget
      t.string :role, default: "buyer", null: false
      t.string :subscription_package
      t.string :password_digest
      t.string :avatar

      t.timestamps
    end
  end
end
