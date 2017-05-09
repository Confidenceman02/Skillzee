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

ActiveRecord::Schema.define(version: 20170508232610) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "course_date_id"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.boolean  "payment",        default: false
    t.index ["course_date_id"], name: "index_bookings_on_course_date_id", using: :btree
    t.index ["user_id"], name: "index_bookings_on_user_id", using: :btree
  end

  create_table "categories", force: :cascade do |t|
    t.string   "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "course_categories", force: :cascade do |t|
    t.integer  "course_id"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["category_id"], name: "index_course_categories_on_category_id", using: :btree
    t.index ["course_id"], name: "index_course_categories_on_course_id", using: :btree
  end

  create_table "course_dates", force: :cascade do |t|
    t.integer  "course_id"
    t.date     "date"
    t.time     "time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_course_dates_on_course_id", using: :btree
  end

  create_table "courses", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "price"
    t.string   "title"
    t.string   "address"
    t.string   "country_code"
    t.string   "city"
    t.string   "state"
    t.text     "description"
    t.integer  "max_students"
    t.decimal  "lng",           precision: 10, scale: 6
    t.decimal  "lat",           precision: 10, scale: 6
    t.text     "notes"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.integer  "duration"
    t.text     "about_teacher"
    t.text     "image_data"
    t.index ["user_id"], name: "index_courses_on_user_id", using: :btree
  end

  create_table "profiles", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "first_name"
    t.string   "gender"
    t.text     "avatar"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_profiles_on_user_id", using: :btree
  end

  create_table "ratings", force: :cascade do |t|
    t.integer  "booking_id"
    t.text     "description"
    t.integer  "score"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["booking_id"], name: "index_ratings_on_booking_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "bookings", "course_dates"
  add_foreign_key "bookings", "users"
  add_foreign_key "course_categories", "categories"
  add_foreign_key "course_categories", "courses"
  add_foreign_key "course_dates", "courses"
  add_foreign_key "courses", "users"
  add_foreign_key "profiles", "users"
  add_foreign_key "ratings", "bookings"
end
