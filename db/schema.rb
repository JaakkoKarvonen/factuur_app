<<<<<<< HEAD
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

ActiveRecord::Schema.define(version: 20140311105950) do

  create_table "products", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "serial"
    t.integer  "price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
=======
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

ActiveRecord::Schema.define(version: 20140311171225) do

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

  create_table "products", force: true do |t|
    t.string   "description"
    t.string   "serial"
    t.integer  "price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
>>>>>>> 3188f478a0500e916ac1e9e4f6649eb451e2d3e5
