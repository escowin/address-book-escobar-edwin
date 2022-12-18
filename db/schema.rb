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

ActiveRecord::Schema[7.0].define(version: 2022_12_18_013805) do
  create_table "addresses", force: :cascade do |t|
    t.string "street"
    t.string "town"
    t.string "zipcode"
    t.string "state"
    t.string "country"
    t.integer "person_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["person_id"], name: "index_addresses_on_person_id"
  end

  create_table "emails", force: :cascade do |t|
    t.string "email"
    t.text "comment"
    t.integer "person_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["person_id"], name: "index_emails_on_person_id"
  end

  create_table "people", force: :cascade do |t|
    t.string "salutation"
    t.string "firstname"
    t.string "middlename"
    t.string "lastname"
    t.string "ssn"
    t.string "dob"
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "phone_numbers", force: :cascade do |t|
    t.string "phone"
    t.text "comment"
    t.integer "person_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["person_id"], name: "index_phone_numbers_on_person_id"
  end

  add_foreign_key "addresses", "people"
  add_foreign_key "emails", "people"
  add_foreign_key "phone_numbers", "people"
end
