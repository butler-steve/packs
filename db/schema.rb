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

ActiveRecord::Schema.define(version: 20150602142246) do

  create_table "items", force: true do |t|
    t.string   "content"
    t.datetime "last_chosen"
    t.integer  "weight"
    t.boolean  "accepted"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "pack_id"
  end

  create_table "packs", force: true do |t|
    t.string   "name"
    t.integer  "expiration_interval"
    t.string   "sched_algo"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "user_id"
  end

  create_table "users", force: true do |t|
    t.string   "email",                        null: false
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_me_token"
    t.datetime "remember_me_token_expires_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["remember_me_token"], name: "index_users_on_remember_me_token"

end
