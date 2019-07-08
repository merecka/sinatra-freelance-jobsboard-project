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

ActiveRecord::Schema.define(version: 20190708202829) do

  create_table "jobs", force: :cascade do |t|
    t.integer  "owner_id"
    t.string   "title"
    t.string   "job_hours"
    t.string   "job_description"
    t.integer  "salary"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "jobs", ["owner_id"], name: "index_jobs_on_owner_id"

  create_table "jobs_users", id: false, force: :cascade do |t|
    t.integer "job_id"
    t.integer "user_id"
  end

  add_index "jobs_users", ["job_id"], name: "index_jobs_users_on_job_id"
  add_index "jobs_users", ["user_id"], name: "index_jobs_users_on_user_id"

  create_table "owners", force: :cascade do |t|
    t.string   "owner_name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "user_name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
