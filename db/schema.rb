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

  create_table "eggs_collections", force: :cascade do |t|
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

  create_table "periods", force: :cascade do |t|
    t.integer "to"
    t.integer "from"
    t.integer "month"
    t.integer "year"
    t.integer "week_number"
  end

  create_table "rules", force: :cascade do |t|
    t.integer "user_id"
    t.boolean "worker", default: true
    t.boolean "manager", default: false
    t.boolean "create_user"
    t.boolean "edit_user"
    t.boolean "edit_all_work_list"
    t.boolean "edit_work_list"
    t.boolean "edit_all_eggs_collection"
    t.boolean "edit_eggs_collection"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "email"
    t.string "nickname"
    t.string "phone"
    t.string "password"
    t.string "telegram"
    t.string "last_name"
    t.boolean "is_available", default: false
  end

  create_table "work_lists", force: :cascade do |t|
    t.integer "user_id"
    t.integer "years"
    t.integer "month"
    t.integer "day"
    t.integer "week"
    t.string "work_start"
    t.string "work_stop"
    t.string "break_start"
    t.string "break_stop"
    t.string "hours"
    t.string "work_list"
  end

  create_table "work_shift_schedules", force: :cascade do |t|
    t.integer "user_id"
    t.string "comment"
    t.string "period_id"
    t.string "monday"
    t.float "monday_hours", default: 0.0
    t.string "tuesday"
    t.float "tuesday_hours", default: 0.0
    t.string "wednesday"
    t.float "wednesday_hours", default: 0.0
    t.string "thursday"
    t.float "thursday_hours", default: 0.0
    t.string "friday"
    t.float "friday_hours", default: 0.0
    t.string "saturday"
    t.float "saturday_hours", default: 0.0
    t.string "sunday"
    t.float "sunday_hours", default: 0.0
  end

end
