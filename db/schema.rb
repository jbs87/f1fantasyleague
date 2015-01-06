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

ActiveRecord::Schema.define(version: 20150106152709) do

  create_table "chassis_manufacturers", force: true do |t|
    t.string   "name"
    t.integer  "price"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "constructorId"
    t.string   "image_url"
  end

  create_table "constructor_markets", force: true do |t|
    t.integer  "chassis_manufacturers_id"
    t.integer  "round"
    t.integer  "value"
    t.integer  "score"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "driver_markets", force: true do |t|
    t.integer  "driver_id"
    t.integer  "round"
    t.integer  "value"
    t.integer  "score"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "drivers", force: true do |t|
    t.string   "name"
    t.integer  "price"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "driverId"
    t.string   "image_url"
  end

  create_table "engines", force: true do |t|
    t.string   "name"
    t.integer  "price"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "constructorId"
    t.string   "image_url"
  end

  create_table "player_teams", force: true do |t|
    t.integer  "user_id"
    t.integer  "driver1_id"
    t.integer  "driver2_id"
    t.integer  "engine_id"
    t.integer  "chassis_manufacturer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "race_id"
    t.integer  "score"
    t.integer  "budget"
  end

  add_index "player_teams", ["chassis_manufacturer_id"], name: "index_player_teams_on_chassis_manufacturer_id"
  add_index "player_teams", ["driver1_id"], name: "index_player_teams_on_driver1_id"
  add_index "player_teams", ["driver2_id"], name: "index_player_teams_on_driver2_id"
  add_index "player_teams", ["engine_id"], name: "index_player_teams_on_engine_id"
  add_index "player_teams", ["race_id"], name: "index_player_teams_on_race_id"
  add_index "player_teams", ["user_id"], name: "index_player_teams_on_user_id"

  create_table "race_results", force: true do |t|
    t.integer  "race_id"
    t.integer  "qualifying_pos"
    t.integer  "race_pos"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "driver_id"
    t.integer  "chassis_manufacturer_id"
    t.integer  "engine_id"
  end

  add_index "race_results", ["chassis_manufacturer_id"], name: "index_race_results_on_chassis_manufacturer_id"
  add_index "race_results", ["driver_id"], name: "index_race_results_on_driver_id"
  add_index "race_results", ["engine_id"], name: "index_race_results_on_engine_id"
  add_index "race_results", ["race_id"], name: "index_race_results_on_race_id"

  create_table "races", force: true do |t|
    t.datetime "date"
    t.integer  "track_id"
    t.string   "name"
    t.integer  "round"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "races", ["track_id"], name: "index_races_on_track_id"

  create_table "realteams", force: true do |t|
    t.integer  "driver1_id"
    t.integer  "driver2_id"
    t.integer  "engine_id"
    t.integer  "chassis_manufacturer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "realteams", ["chassis_manufacturer_id"], name: "index_realteams_on_chassis_manufacturer_id"
  add_index "realteams", ["engine_id"], name: "index_realteams_on_engine_id"

  create_table "scoring_overviews", force: true do |t|
    t.integer  "driver_qual"
    t.integer  "driver_race"
    t.integer  "chassis_qual"
    t.integer  "chassis_race"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position"
  end

  create_table "tracks", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "circuitId"
    t.decimal  "lat",         precision: 10, scale: 6
    t.decimal  "long",        precision: 10, scale: 6
    t.string   "country"
    t.string   "locality"
    t.string   "circuitName"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "crypted_password"
    t.string   "salt"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

  create_table "value_overviews", force: true do |t|
    t.integer  "position"
    t.integer  "driver_race"
    t.integer  "chassis_race"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
