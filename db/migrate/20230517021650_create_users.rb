class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :fullname
      t.string :role
      t.string :subscription_package
      t.string :avatar
      t.string :contact
      t.string :email
      t.string :password_digest
      t.float :budget
      t.string :company_name
      t.string :location

      t.timestamps
    end
  end
end
