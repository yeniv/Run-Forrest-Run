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

ActiveRecord::Schema.define(version: 2019_06_19_192024) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "forrest_gumps", force: :cascade do |t|
    t.string "name"
    t.integer "distance"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "route"
    t.string "quotes"
    t.integer "route_distance"
    t.string "starting_position"
  end

  create_table "tweets", force: :cascade do |t|
    t.bigint "forrest_gump_id"
    t.string "name"
    t.text "message"
    t.string "avatar"
    t.datetime "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "tweet_id"
    t.string "screen_name"
    t.string "photo"
    t.integer "mile"
    t.index ["forrest_gump_id"], name: "index_tweets_on_forrest_gump_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "tweets", "forrest_gumps"
end
