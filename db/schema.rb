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

ActiveRecord::Schema.define(version: 20140724074322) do

  create_table "plans", force: true do |t|
    t.string   "title"
    t.string   "detail"
    t.integer  "size"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "plans", ["user_id"], name: "index_plans_on_user_id"

  create_table "plans_users", id: false, force: true do |t|
    t.integer "plan_id", null: false
    t.integer "user_id", null: false
  end

  add_index "plans_users", ["plan_id", "user_id"], name: "index_plans_users_on_plan_id_and_user_id"
  add_index "plans_users", ["user_id", "plan_id"], name: "index_plans_users_on_user_id_and_plan_id"

  create_table "users", force: true do |t|
    t.string   "login",               default: "", null: false
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",       default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["login"], name: "index_users_on_login", unique: true

end
