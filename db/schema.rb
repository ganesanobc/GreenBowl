# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_06_15_184841) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.integer "role", default: 0, null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "kitchen_operators", force: :cascade do |t|
    t.bigint "kitchen_id"
    t.bigint "operator_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["kitchen_id"], name: "index_kitchen_operators_on_kitchen_id"
    t.index ["operator_id"], name: "index_kitchen_operators_on_operator_id"
  end

  create_table "kitchens", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.bigint "restaurant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["restaurant_id"], name: "index_kitchens_on_restaurant_id"
  end

  create_table "restaurant_managers", force: :cascade do |t|
    t.bigint "restaurant_id"
    t.bigint "manager_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["manager_id"], name: "index_restaurant_managers_on_manager_id"
    t.index ["restaurant_id"], name: "index_restaurant_managers_on_restaurant_id"
  end

  create_table "restaurants", force: :cascade do |t|
    t.string "brand"
    t.string "branch"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "kitchen_operators", "admins", column: "operator_id"
  add_foreign_key "kitchen_operators", "kitchens"
  add_foreign_key "kitchens", "restaurants"
  add_foreign_key "restaurant_managers", "admins", column: "manager_id"
  add_foreign_key "restaurant_managers", "restaurants"
end
