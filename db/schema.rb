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

ActiveRecord::Schema.define(version: 20180315080802) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "developer_language_relations", force: :cascade do |t|
    t.integer "developer_id"
    t.integer "language_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "developer_languages", force: :cascade do |t|
    t.integer "developer_id"
    t.integer "language_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "developer_programming_language_relations", force: :cascade do |t|
    t.integer "developer_id"
    t.integer "programming_language_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "developer_programming_languages", force: :cascade do |t|
    t.integer "developer_id"
    t.integer "programming_language_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "developer_programmings", force: :cascade do |t|
    t.integer "developer_id"
    t.integer "programming_language_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["developer_id"], name: "index_developer_programmings_on_developer_id"
    t.index ["programming_language_id"], name: "index_developer_programmings_on_programming_language_id"
  end

  create_table "developers", force: :cascade do |t|
    t.string "email", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_developers_on_email", unique: true
  end

  create_table "languages", force: :cascade do |t|
    t.string "code", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_languages_on_code", unique: true
  end

  create_table "programming_languages", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_programming_languages_on_name", unique: true
  end

end
