# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 6) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "customers", force: :cascade do |t|
    t.string "name"
    t.string "adress"
    t.string "email"
  end

  create_table "employees", force: :cascade do |t|
    t.string "name"
    t.string "username"
    t.string "password_digest"
    t.string "adress"
    t.string "email"
  end

  create_table "games", force: :cascade do |t|
    t.string "name"
    t.string "genere"
    t.decimal "sales_price"
    t.decimal "vendor_cost"
    t.integer "stock"
  end

  create_table "purchaseorders", force: :cascade do |t|
    t.integer "game_id"
    t.integer "employee_id"
    t.integer "vendor_id"
    t.integer "quantity"
    t.decimal "cost"
  end

  create_table "sales", force: :cascade do |t|
    t.integer "customer_id"
    t.integer "game_id"
    t.integer "employee_id"
    t.integer "quantity"
  end

  create_table "vendors", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "email"
  end

end
