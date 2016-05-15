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

ActiveRecord::Schema.define(version: 20150221034055) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "places", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "facebook_id"
    t.string   "external_id", limit: 255
  end

  add_index "places", ["external_id"], name: "index_places_on_external_id", unique: true, using: :btree
  add_index "places", ["facebook_id"], name: "index_places_on_facebook_id", unique: true, using: :btree

  create_table "specials", force: :cascade do |t|
    t.integer  "place_id"
    t.string   "starts_at",  default: "15:00"
    t.string   "ends_at",    default: "18:00"
    t.integer  "start_day",  default: 1
    t.integer  "end_day",    default: 5
    t.text     "details"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "specials", ["place_id"], name: "index_specials_on_place_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "image_url"
    t.boolean  "admin",      default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
