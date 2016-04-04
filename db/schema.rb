# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160328185545) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "books", force: true do |t|
    t.string   "title"
    t.integer  "release_year"
    t.float    "price"
    t.string   "image_url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "author"
    t.string   "product_savings"
    t.string   "indigo_link"
    t.string   "availability_value"
    t.float    "strike_price"
    t.float    "prominent_price"
    t.string   "book_type"
    t.text     "description"
    t.string   "category"
  end

  create_table "purchases", force: true do |t|
    t.integer  "book_id"
    t.integer  "buyer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "purchases", ["book_id", "buyer_id"], name: "index_purchases_on_book_id_and_buyer_id", unique: true, using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "braintree_customer_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
