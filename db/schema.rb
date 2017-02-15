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

ActiveRecord::Schema.define(version: 20160902125452) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "blip_images", force: :cascade do |t|
    t.string   "image"
    t.integer  "waypoint_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "blip_images", ["waypoint_id"], name: "index_blip_images_on_waypoint_id", using: :btree

  create_table "driftmaps", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.float    "init_x"
    t.float    "init_y"
    t.integer  "init_zoom"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "driftmaps", ["user_id"], name: "index_driftmaps_on_user_id", using: :btree

  create_table "journeys", force: :cascade do |t|
    t.text     "description"
    t.string   "title"
    t.string   "coverphoto"
    t.integer  "driftmap_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "journeys", ["driftmap_id"], name: "index_journeys_on_driftmap_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "gps"
    t.string   "from"
    t.string   "password_digest"
    t.string   "remember_digest"
    t.boolean  "admin",             default: false
    t.boolean  "activated",         default: false
    t.string   "activation_digest"
    t.datetime "activated_at"
    t.string   "profile_pic"
    t.string   "reset_digest"
    t.datetime "reset_sent_at"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree

  create_table "waypoints", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.float    "x"
    t.float    "y"
    t.datetime "date"
    t.integer  "journey_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "waypoints", ["journey_id"], name: "index_waypoints_on_journey_id", using: :btree

  add_foreign_key "blip_images", "waypoints"
  add_foreign_key "journeys", "driftmaps"
  add_foreign_key "waypoints", "journeys"
end
