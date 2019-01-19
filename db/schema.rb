# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20190119101100) do

  create_table "feature_controls", force: :cascade do |t|
    t.string   "feature_name"
    t.string   "type_control"
    t.string   "value"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "features", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "school_classes", force: :cascade do |t|
    t.string   "name"
    t.integer  "year"
    t.integer  "teacher_id"
    t.integer  "school_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "schools", force: :cascade do |t|
    t.string   "name"
    t.integer  "parent_id"
    t.string   "payment_type"
    t.integer  "owner_id"
    t.integer  "hq_owner_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "trackings", force: :cascade do |t|
    t.string   "child_name"
    t.integer  "class_id"
    t.datetime "time_check_in"
    t.datetime "time_check_out"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.integer  "role_id"
    t.boolean  "is_paid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end