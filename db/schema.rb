# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_07_21_152103) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "eggs_collection", force: :cascade do |t|
    t.integer "user_id"
    t.string "years"
    t.string "month"
    t.integer "day"
    t.string "lsl_prima"
    t.string "craggs"
    t.string "big_plus_small"
    t.string "floor_eggs"
    t.string "egg_weight"
    t.string "deads"
    t.string "water_ml_day"
    t.string "feed_g_day"
    t.string "hen_weight"
    t.boolean "check_nests"
    t.string "mark_1"
    t.string "mark_1_with_years"
    t.string "info_started"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "email"
    t.string "nickname"
    t.string "phone"
    t.string "password"
    t.string "telegram"
    t.string "last_name"
    t.boolean "create_user"
    t.boolean "edit_user"
    t.boolean "edit_all_work_list"
    t.boolean "edit_all_eggs_collection"
  end

  create_table "work_list", force: :cascade do |t|
    t.integer "user_id"
    t.string "years"
    t.string "month"
    t.integer "day"
    t.string "work_start"
    t.string "work_stop"
    t.string "break_start"
    t.string "break_stop"
    t.string "hours"
    t.string "work_list"
  end

end
