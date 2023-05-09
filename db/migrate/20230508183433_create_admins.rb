class CreateAdmins < ActiveRecord::Migration[7.0]
  def change
    create_table :admins do |t|
      t.string :username
      t.string :fullname
      t.string :email
      t.string :contact
      t.string :role, default: "admin", null: false
      t.string :avatar
      t.string :password_digest

      t.timestamps
    end
  end
end
