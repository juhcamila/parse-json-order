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

ActiveRecord::Schema.define(version: 2021_03_07_180534) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "customers", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "contact"
    t.string "externalCode"
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.float "price"
    t.integer "quantity"
    t.string "externalCode"
    t.float "total"
    t.bigint "order_id", null: false
    t.index ["order_id"], name: "index_items_on_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "storeId"
    t.string "externalCode"
    t.string "subTotal"
    t.string "deliveryFee"
    t.float "total_shipping"
    t.string "total"
    t.string "country"
    t.string "state"
    t.string "city"
    t.string "district"
    t.string "street"
    t.string "complement"
    t.float "latitude"
    t.float "longitude"
    t.datetime "dtOrderCreate"
    t.string "postalCode"
    t.string "number"
    t.bigint "customer_id", null: false
    t.index ["customer_id"], name: "index_orders_on_customer_id"
  end

  create_table "payments", force: :cascade do |t|
    t.string "payment_type"
    t.float "value"
    t.bigint "order_id", null: false
    t.index ["order_id"], name: "index_payments_on_order_id"
  end

  add_foreign_key "items", "orders"
  add_foreign_key "orders", "customers"
  add_foreign_key "payments", "orders"
end
