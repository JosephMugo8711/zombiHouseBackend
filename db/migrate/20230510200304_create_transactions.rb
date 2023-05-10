class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.string :amount
      t.references :buyer, null: false, foreign_key: true
      t.references :seller, null: false, foreign_key: true
      t.references :admin, null: false, foreign_key: true
      t.references :subscription_package, null: false, foreign_key: true
      t.string :payment_status
      t.string :payment_method
      t.string :mpesa_transaction_id

      t.timestamps
    end
  end
end
