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

ActiveRecord::Schema.define(version: 20180216041952) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "games", force: :cascade do |t|
    t.integer "winning_team_id"
    t.integer "losing_team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["losing_team_id"], name: "index_games_on_losing_team_id"
    t.index ["winning_team_id"], name: "index_games_on_winning_team_id"
  end

  create_table "teams", force: :cascade do |t|
    t.integer "captain_id"
    t.integer "player_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["captain_id"], name: "index_teams_on_captain_id"
    t.index ["player_id"], name: "index_teams_on_player_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "handle"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email"
    t.float "trueskill_mean", default: 25.0
    t.float "trueskill_deviation", default: 8.333333333333334
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["handle"], name: "index_users_on_handle", unique: true
  end

end
