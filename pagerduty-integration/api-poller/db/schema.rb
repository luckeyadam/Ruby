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

ActiveRecord::Schema.define(version: 2019_10_13_184901) do

  create_table "alerts", force: :cascade do |t|
    t.string "alert_id"
    t.string "status"
    t.string "assigned_to"
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "alerts_endpoints", id: false, force: :cascade do |t|
    t.integer "alert_id", null: false
    t.integer "endpoint_id", null: false
  end

  create_table "endpoint_alerts", force: :cascade do |t|
    t.string "identifier"
    t.string "title"
    t.string "description"
    t.string "status"
    t.integer "endpoint_config_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["endpoint_config_id"], name: "index_endpoint_alerts_on_endpoint_config_id"
  end

  create_table "endpoint_configs", force: :cascade do |t|
    t.string "url"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "payload"
  end

end
