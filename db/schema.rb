# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_05_12_203736) do
  create_table "access_tokens", force: :cascade do |t|
    t.string "token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "admins", force: :cascade do |t|
    t.string "username"
    t.string "fullname"
    t.string "email"
    t.string "contact"
    t.string "role", default: "admin", null: false
    t.string "avatar"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "buyers", force: :cascade do |t|
    t.string "username"
    t.string "fullname"
    t.string "email"
    t.string "contact"
    t.integer "budget"
    t.string "role", default: "buyer", null: false
    t.string "subscription_package"
    t.string "password_digest"
    t.string "avatar"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "properties", force: :cascade do |t|
    t.string "location"
    t.decimal "price"
    t.integer "seller_id", null: false
    t.integer "buyer_id", null: false
    t.string "status"
    t.string "property_type"
    t.text "description"
    t.integer "size_in_sqft"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["buyer_id"], name: "index_properties_on_buyer_id"
    t.index ["seller_id"], name: "index_properties_on_seller_id"
  end

  create_table "sellers", force: :cascade do |t|
    t.string "company_name"
    t.string "location"
    t.string "contact"
    t.string "email"
    t.string "password_digest"
    t.string "subscription_package"
    t.string "role", default: "seller", null: false
    t.string "avatar"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subs_mpesas", force: :cascade do |t|
    t.string "phoneNumber"
    t.string "amount"
    t.string "checkoutRequestID"
    t.string "merchantRequestID"
    t.string "mpesaReceiptNumber"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subscription_packages", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "price"
    t.string "duration"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "transactions", force: :cascade do |t|
    t.string "amount"
    t.integer "buyer_id", null: false
    t.integer "seller_id", null: false
    t.integer "admin_id", null: false
    t.integer "subscription_package_id", null: false
    t.string "payment_status"
    t.string "payment_method"
    t.string "mpesa_transaction_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admin_id"], name: "index_transactions_on_admin_id"
    t.index ["buyer_id"], name: "index_transactions_on_buyer_id"
    t.index ["seller_id"], name: "index_transactions_on_seller_id"
    t.index ["subscription_package_id"], name: "index_transactions_on_subscription_package_id"
  end

  add_foreign_key "properties", "buyers"
  add_foreign_key "properties", "sellers"
  add_foreign_key "transactions", "admins"
  add_foreign_key "transactions", "buyers"
  add_foreign_key "transactions", "sellers"
  add_foreign_key "transactions", "subscription_packages"
end
