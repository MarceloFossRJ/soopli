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

ActiveRecord::Schema.define(version: 20170901185336) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "soopli_categories", force: :cascade do |t|
    t.string   "name"
    t.integer  "status_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "soopli_category_versions", force: :cascade do |t|
    t.string   "item_type",      null: false
    t.integer  "item_id",        null: false
    t.string   "event",          null: false
    t.string   "whodunnit"
    t.text     "object"
    t.text     "object_changes"
    t.datetime "created_at"
    t.index ["item_type", "item_id"], name: "index_soopli_category_versions_on_item_type_and_item_id", using: :btree
  end

  create_table "soopli_contract_type_versions", force: :cascade do |t|
    t.string   "item_type",      null: false
    t.integer  "item_id",        null: false
    t.string   "event",          null: false
    t.string   "whodunnit"
    t.text     "object"
    t.text     "object_changes"
    t.datetime "created_at"
    t.index ["item_type", "item_id"], name: "index_soopli_contract_type_versions_on_item_type_and_item_id", using: :btree
  end

  create_table "soopli_contract_types", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "soopli_customer_versions", force: :cascade do |t|
    t.string   "item_type",      null: false
    t.integer  "item_id",        null: false
    t.string   "event",          null: false
    t.string   "whodunnit"
    t.text     "object"
    t.text     "object_changes"
    t.datetime "created_at"
    t.index ["item_type", "item_id"], name: "index_soopli_customer_versions_on_item_type_and_item_id", using: :btree
  end

  create_table "soopli_customers", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "soopli_entities", force: :cascade do |t|
    t.string   "name"
    t.integer  "status_id"
    t.string   "registration_name"
    t.string   "website"
    t.string   "twitter"
    t.string   "linkedin"
    t.date     "finantial_year"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "soopli_entity_versions", force: :cascade do |t|
    t.string   "item_type",      null: false
    t.integer  "item_id",        null: false
    t.string   "event",          null: false
    t.string   "whodunnit"
    t.text     "object"
    t.text     "object_changes"
    t.datetime "created_at"
    t.index ["item_type", "item_id"], name: "index_soopli_entity_versions_on_item_type_and_item_id", using: :btree
  end

  create_table "soopli_event_type_versions", force: :cascade do |t|
    t.string   "item_type",      null: false
    t.integer  "item_id",        null: false
    t.string   "event",          null: false
    t.string   "whodunnit"
    t.text     "object"
    t.text     "object_changes"
    t.datetime "created_at"
    t.index ["item_type", "item_id"], name: "index_soopli_event_type_versions_on_item_type_and_item_id", using: :btree
  end

  create_table "soopli_event_types", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "soopli_people", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.string   "mobile"
    t.integer  "position_id"
    t.string   "type"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "soopli_person_versions", force: :cascade do |t|
    t.string   "item_type",      null: false
    t.integer  "item_id",        null: false
    t.string   "event",          null: false
    t.string   "whodunnit"
    t.text     "object"
    t.text     "object_changes"
    t.datetime "created_at"
    t.index ["item_type", "item_id"], name: "index_soopli_person_versions_on_item_type_and_item_id", using: :btree
  end

  create_table "soopli_position_versions", force: :cascade do |t|
    t.string   "item_type",      null: false
    t.integer  "item_id",        null: false
    t.string   "event",          null: false
    t.string   "whodunnit"
    t.text     "object"
    t.text     "object_changes"
    t.datetime "created_at"
    t.index ["item_type", "item_id"], name: "index_soopli_position_versions_on_item_type_and_item_id", using: :btree
  end

  create_table "soopli_positions", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "soopli_rag_statuses", force: :cascade do |t|
    t.string   "rag_status"
    t.text     "description"
    t.integer  "rag_statusable_id"
    t.string   "rag_statusable_type"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["rag_statusable_id", "rag_statusable_type"], name: "soopli_rag_statuses_poly", using: :btree
  end

  create_table "soopli_statuses", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "soopli_supplier_type_versions", force: :cascade do |t|
    t.string   "item_type",      null: false
    t.integer  "item_id",        null: false
    t.string   "event",          null: false
    t.string   "whodunnit"
    t.text     "object"
    t.text     "object_changes"
    t.datetime "created_at"
    t.index ["item_type", "item_id"], name: "index_soopli_supplier_type_versions_on_item_type_and_item_id", using: :btree
  end

  create_table "soopli_supplier_types", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "soopli_supplier_versions", force: :cascade do |t|
    t.string   "item_type",      null: false
    t.integer  "item_id",        null: false
    t.string   "event",          null: false
    t.string   "whodunnit"
    t.text     "object"
    t.text     "object_changes"
    t.datetime "created_at"
    t.index ["item_type", "item_id"], name: "index_soopli_supplier_versions_on_item_type_and_item_id", using: :btree
  end

  create_table "soopli_suppliers", force: :cascade do |t|
    t.string   "name"
    t.string   "website"
    t.string   "twitter"
    t.string   "linkedin"
    t.string   "facebook"
    t.string   "github"
    t.string   "instagram"
    t.string   "registration_country"
    t.date     "finantial_year"
    t.date     "relation_started_at"
    t.integer  "status_id"
    t.integer  "supplier_type_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "soopli_team_versions", force: :cascade do |t|
    t.string   "item_type",      null: false
    t.integer  "item_id",        null: false
    t.string   "event",          null: false
    t.string   "whodunnit"
    t.text     "object"
    t.text     "object_changes"
    t.datetime "created_at"
    t.index ["item_type", "item_id"], name: "index_soopli_team_versions_on_item_type_and_item_id", using: :btree
  end

  create_table "soopli_teams", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

end
