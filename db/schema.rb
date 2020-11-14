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

ActiveRecord::Schema.define(version: 2020_11_10_223937) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "course_details", force: :cascade do |t|
    t.integer "hole_number"
    t.integer "hole_par"
    t.bigint "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_course_details_on_course_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "name"
    t.integer "holes"
    t.integer "par"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "scores", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "hole_number"
    t.integer "hole_score"
    t.bigint "course_id"
    t.bigint "user_id"
    t.index ["course_id"], name: "index_scores_on_course_id"
    t.index ["user_id"], name: "index_scores_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "course_details", "courses"
  add_foreign_key "scores", "courses"
  add_foreign_key "scores", "users"
end
