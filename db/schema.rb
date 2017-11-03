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

ActiveRecord::Schema.define(version: 20171029061650) do

  create_table "appointments", force: :cascade do |t|
    t.datetime "datetime"
    t.string "venue"
    t.integer "candidate_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["candidate_id"], name: "index_appointments_on_candidate_id"
  end

  create_table "candidates", force: :cascade do |t|
    t.string "name"
    t.string "father_name"
    t.string "mother_name"
    t.string "education"
    t.text "contact_address"
    t.string "parent_contact_number", null: false
    t.string "alternate_parent_contact_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.string "marksheet_file_name"
    t.string "marksheet_content_type"
    t.integer "marksheet_file_size"
    t.datetime "marksheet_updated_at"
    t.integer "section_id"
    t.integer "user_id"
    t.string "admission_status", default: "Under Process"
    t.text "rejection_reason"
    t.string "grade", default: ""
    t.index ["section_id"], name: "index_candidates_on_section_id"
    t.index ["user_id"], name: "index_candidates_on_user_id"
  end

  create_table "eligibilities", force: :cascade do |t|
    t.string "title"
    t.text "criteria"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fees", force: :cascade do |t|
    t.string "fee_name"
    t.string "fee_mode"
    t.integer "fee_amount"
    t.integer "section_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["section_id"], name: "index_fees_on_section_id"
  end

  create_table "notices", force: :cascade do |t|
    t.string "notice_title"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "payments", force: :cascade do |t|
    t.string "payment_name"
    t.integer "amount"
    t.string "payment_mode"
    t.string "payment_image_file_name"
    t.string "payment_image_content_type"
    t.integer "payment_image_file_size"
    t.datetime "payment_image_updated_at"
    t.string "payment_status", default: ""
    t.integer "candidate_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["candidate_id"], name: "index_payments_on_candidate_id"
  end

  create_table "sections", force: :cascade do |t|
    t.string "section_name"
    t.text "section_grades"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email", default: "", null: false
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
  end

end
