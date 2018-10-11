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

ActiveRecord::Schema.define(version: 2018_10_08_144206) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "action_text_rich_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "alerts", force: :cascade do |t|
    t.integer "severity", default: 0, null: false
    t.datetime "start_date"
    t.datetime "end_date"
    t.string "alertable_type"
    t.bigint "alertable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["alertable_id", "alertable_type"], name: "index_alerts_on_alertable_id_and_alertable_type"
    t.index ["alertable_type", "alertable_id"], name: "index_alerts_on_alertable_type_and_alertable_id"
  end

  create_table "buildings", force: :cascade do |t|
    t.integer "bldrecnbr"
    t.float "latitude"
    t.float "longitude"
    t.string "name", null: false
    t.string "nick_name", null: false
    t.string "abbreviation"
    t.string "address", null: false
    t.string "city", null: false
    t.string "state", null: false
    t.string "zip", null: false
    t.string "country", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["abbreviation"], name: "index_buildings_on_abbreviation"
    t.index ["bldrecnbr"], name: "index_buildings_on_bldrecnbr", unique: true
    t.index ["name"], name: "index_buildings_on_name"
    t.index ["nick_name"], name: "index_buildings_on_nick_name"
  end

  create_table "room_characteristics", force: :cascade do |t|
    t.integer "rmrecnbr"
    t.integer "chrstc"
    t.integer "chrstc_eff_status"
    t.string "chrstc_descrshort"
    t.string "chrstc_descr"
    t.string "chrstc_desc254"
    t.bigint "room_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_id"], name: "index_room_characteristics_on_room_id"
  end

  create_table "room_contacts", force: :cascade do |t|
    t.bigint "room_id"
    t.integer "rmrecnbr"
    t.string "rm_schd_cntct_name"
    t.string "rm_schd_email"
    t.string "rm_schd_cntct_phone"
    t.string "rm_det_url"
    t.string "rm_usage_guidlns_url"
    t.string "rm_sppt_deptid"
    t.string "rm_sppt_dept_descr"
    t.string "rm_sppt_cntct_email"
    t.string "rm_sppt_cntct_phone"
    t.string "rm_sppt_cntct_url"
    t.index ["room_id"], name: "index_room_contacts_on_room_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.integer "rmrecnbr", null: false
    t.float "latitude"
    t.float "longitude"
    t.string "floor", null: false
    t.string "room_number", null: false
    t.string "facility_code_heprod", null: false
    t.string "rmtyp_description"
    t.integer "dept_id"
    t.integer "dept_grp"
    t.integer "square_feet"
    t.integer "instructional_seating_count"
    t.bigint "building_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["building_id"], name: "index_rooms_on_building_id"
    t.index ["facility_code_heprod"], name: "index_rooms_on_facility_code_heprod"
    t.index ["rmrecnbr"], name: "index_rooms_on_rmrecnbr", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "uniqname"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["uniqname"], name: "index_users_on_uniqname", unique: true
  end

  add_foreign_key "room_characteristics", "rooms"
  add_foreign_key "room_contacts", "rooms"
  add_foreign_key "rooms", "buildings"
end
