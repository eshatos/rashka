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

ActiveRecord::Schema.define(version: 20140314100832) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "news", force: true do |t|
    t.string   "title",      null: false
    t.string   "text",       null: false
    t.string   "link",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "place_types", force: true do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "places", force: true do |t|
    t.float    "lng",        null: false
    t.float    "lat",        null: false
    t.string   "name",       null: false
    t.integer  "type_id",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "places", ["type_id"], name: "index_places_on_type_id", using: :btree

  create_table "reasons", force: true do |t|
    t.string   "text",                   null: false
    t.integer  "popularity", default: 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "settings", force: true do |t|
    t.string   "login"
    t.string   "password_hash"
    t.string   "password_salt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stats", force: true do |t|
    t.integer  "people_left", default: 0
    t.integer  "shares_vk",   default: 0
    t.integer  "shares_tw",   default: 0
    t.integer  "shares_fb",   default: 0
    t.integer  "shares_bl",   default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
