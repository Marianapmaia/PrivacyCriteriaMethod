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

ActiveRecord::Schema.define(version: 2019_02_12_230456) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "mecs", force: :cascade do |t|
    t.bigint "privacy_criterium_id"
    t.string "mec"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["privacy_criterium_id"], name: "index_mecs_on_privacy_criterium_id"
  end

  create_table "personal_informations", force: :cascade do |t|
    t.bigint "privacy_criterium_id"
    t.string "tipo"
    t.string "list"
    t.text "desc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["privacy_criterium_id"], name: "index_personal_informations_on_privacy_criterium_id"
  end

  create_table "privacy_criteria", force: :cascade do |t|
    t.bigint "project_id"
    t.string "name"
    t.string "id_pc"
    t.string "requirement"
    t.text "description"
    t.string "source"
    t.string "owner"
    t.string "rel_owner"
    t.string "processor"
    t.string "rel_processor"
    t.string "third"
    t.string "rel_third"
    t.string "privacy_preference"
    t.string "privacy_compliance"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "priority"
    t.index ["project_id"], name: "index_privacy_criteria_on_project_id"
  end

  create_table "projects", force: :cascade do |t|
    t.bigint "user_id"
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_projects_on_user_id"
  end

  create_table "risks", force: :cascade do |t|
    t.bigint "privacy_criterium_id"
    t.string "vul"
    t.string "thread"
    t.string "harm"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["privacy_criterium_id"], name: "index_risks_on_privacy_criterium_id"
  end

  create_table "shares", force: :cascade do |t|
    t.bigint "project_id"
    t.bigint "user_id"
    t.integer "accessa"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_shares_on_project_id"
    t.index ["user_id"], name: "index_shares_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "mecs", "privacy_criteria"
  add_foreign_key "personal_informations", "privacy_criteria"
  add_foreign_key "privacy_criteria", "projects"
  add_foreign_key "projects", "users"
  add_foreign_key "risks", "privacy_criteria"
  add_foreign_key "shares", "projects"
  add_foreign_key "shares", "users"
end
