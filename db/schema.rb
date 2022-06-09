# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_06_09_062723) do

  create_table "saunas", force: :cascade do |t|
    t.string "name", default: "平均的なサウナ", null: false
    t.integer "sauna_temperature", default: 90, null: false
    t.integer "sauna_humidity", default: 10, null: false
    t.integer "water_temperature", default: 20, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "timer_id"
    t.index ["timer_id"], name: "index_saunas_on_timer_id"
  end

  create_table "timers", force: :cascade do |t|
    t.datetime "sauna_start_time"
    t.datetime "sauna_finish_time"
    t.datetime "water_start_time"
    t.datetime "water_finish_time"
    t.datetime "outside_start_time"
    t.datetime "outside_finish_time"
    t.datetime "sauna_deadline"
    t.datetime "water_deadline"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "sauna_id"
    t.index ["sauna_id"], name: "index_timers_on_sauna_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.integer "condition"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "saunas", "timers"
  add_foreign_key "timers", "saunas"
end
