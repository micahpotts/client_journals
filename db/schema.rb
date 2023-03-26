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

ActiveRecord::Schema[7.0].define(version: 2023_03_24_224314) do
  create_table "clients", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "plan"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "providers_id", null: false
    t.index ["email"], name: "index_clients_on_email", unique: true
    t.index ["providers_id"], name: "index_clients_on_providers_id"
  end

  create_table "journal_entries", force: :cascade do |t|
    t.string "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "clients_id", null: false
    t.index ["clients_id"], name: "index_journal_entries_on_clients_id"
  end

  create_table "providers", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_providers_on_email", unique: true
  end

  add_foreign_key "clients", "providers", column: "providers_id"
  add_foreign_key "journal_entries", "clients", column: "clients_id"
end
