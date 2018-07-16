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

ActiveRecord::Schema.define(version: 2018_07_16_162631) do

  create_table "babies", force: :cascade do |t|
    t.string "name"
    t.string "sex"
    t.date "dob"
    t.string "picture"
    t.text "allergies"
    t.string "emergency_contact"
    t.integer "caregiver_id"
    t.integer "mom_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "caregivers", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.integer "age"
    t.integer "experience"
    t.string "picture"
    t.string "phone_number"
    t.integer "rating"
    t.text "address"
    t.boolean "availability"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dailylogs", force: :cascade do |t|
    t.datetime "time_in"
    t.string "nap"
    t.string "meal"
    t.string "diaper"
    t.string "play"
    t.text "summary"
    t.string "meds"
    t.datetime "time_out"
    t.integer "baby_id"
    t.integer "caregiver_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "moms", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.string "picture"
    t.string "phone_number"
    t.text "pick_up_authorization"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
