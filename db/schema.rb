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

ActiveRecord::Schema.define(version: 20150921150220) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "behavior_reports", force: :cascade do |t|
    t.integer  "behavior_id"
    t.integer  "occurrences",                 null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "removed",     default: false, null: false
  end

  create_table "behaviors", force: :cascade do |t|
    t.integer  "client_id"
    t.string   "encrypted_description",                 null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "removed",               default: false, null: false
  end

  create_table "clients", force: :cascade do |t|
    t.string   "encrypted_last_name",                 null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest",                     null: false
    t.string   "remember_token"
    t.integer  "user_id"
    t.boolean  "removed",             default: false, null: false
    t.index ["remember_token"], name: "index_clients_on_remember_token", using: :btree
  end

  create_table "maintenances", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "reports_deleted"
    t.integer  "behaviors_deleted"
    t.integer  "clients_deleted"
    t.integer  "total_deleted"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "deleted_user"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "encrypted_first_name"
    t.string   "encrypted_last_name"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end
