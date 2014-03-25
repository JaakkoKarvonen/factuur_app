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

ActiveRecord::Schema.define(version: 20140325134714) do

  create_table "contacts", force: true do |t|
    t.string   "company"
    t.string   "name"
    t.string   "address"
    t.string   "postcode"
    t.string   "city"
    t.integer  "kvk"
    t.string   "btw"
    t.string   "email"
    t.string   "account"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "contacts", ["email"], name: "index_contacts_on_email", unique: true

  create_table "invoices", force: true do |t|
    t.date     "date"
    t.integer  "contact_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "product_fields", force: true do |t|
    t.string   "product"
    t.string   "amount"
    t.integer  "invoice_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "product_fields", ["invoice_id"], name: "index_product_fields_on_invoice_id"

  create_table "products", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "serial"
    t.decimal  "price",       precision: 8, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "profiles", force: true do |t|
    t.string   "company"
    t.string   "name"
    t.string   "address"
    t.string   "postcode"
    t.string   "city"
    t.string   "email"
    t.string   "btw"
    t.integer  "kvk"
    t.string   "account"
    t.integer  "phone"
    t.string   "site"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "profiles", ["email"], name: "index_profiles_on_email", unique: true

  create_table "settings", force: true do |t|
    t.string   "currency"
    t.string   "term"
    t.string   "conditions"
    t.string   "btw"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

end
