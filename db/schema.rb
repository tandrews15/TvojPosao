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

ActiveRecord::Schema.define(version: 2020_10_19_195403) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "job_aplications", force: :cascade do |t|
    t.string "name"
    t.datetime "date_of_birth"
    t.string "email"
    t.string "phone_num"
    t.string "address"
    t.string "education"
    t.bigint "job_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.index ["job_id"], name: "index_job_aplications_on_job_id"
    t.index ["user_id", "job_id"], name: "index_job_aplications_on_user_id_and_job_id", unique: true
    t.index ["user_id"], name: "index_job_aplications_on_user_id"
  end

  create_table "jobs", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "category"
    t.datetime "expiration_date"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_jobs_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", default: "", null: false
    t.boolean "employer", default: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "job_aplications", "jobs"
  add_foreign_key "job_aplications", "users"
  add_foreign_key "jobs", "users"
end
