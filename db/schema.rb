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

ActiveRecord::Schema.define(version: 20160713223343) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "complaints", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.text     "screenshot"
    t.integer  "company_id"
    t.integer  "vote_count"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["company_id"], name: "index_complaints_on_company_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "users_complaints", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "complaint_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["complaint_id"], name: "index_users_complaints_on_complaint_id", using: :btree
    t.index ["user_id"], name: "index_users_complaints_on_user_id", using: :btree
  end

  add_foreign_key "complaints", "companies"
  add_foreign_key "users_complaints", "complaints"
  add_foreign_key "users_complaints", "users"
end
