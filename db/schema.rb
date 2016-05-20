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

ActiveRecord::Schema.define(version: 20160519234835) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "commitments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "goal_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["goal_id", "user_id"], name: "index_commitments_on_goal_id_and_user_id", unique: true, using: :btree
    t.index ["goal_id"], name: "index_commitments_on_goal_id", using: :btree
    t.index ["user_id"], name: "index_commitments_on_user_id", using: :btree
  end

  create_table "goals", force: :cascade do |t|
    t.integer  "hackday_id"
    t.integer  "project_id"
    t.text     "aim"
    t.text     "help_required"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "likes_count",   default: 0
    t.index ["hackday_id"], name: "index_goals_on_hackday_id", using: :btree
    t.index ["project_id"], name: "index_goals_on_project_id", using: :btree
  end

  create_table "hackdays", force: :cascade do |t|
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["start_date", "end_date"], name: "index_hackdays_on_start_date_and_end_date", unique: true, using: :btree
  end

  create_table "likes", force: :cascade do |t|
    t.integer  "goal_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["goal_id", "user_id"], name: "index_likes_on_goal_id_and_user_id", unique: true, using: :btree
    t.index ["goal_id"], name: "index_likes_on_goal_id", using: :btree
    t.index ["user_id"], name: "index_likes_on_user_id", using: :btree
  end

  create_table "projects", force: :cascade do |t|
    t.string "name",           limit: 128
    t.string "url",            limit: 64
    t.string "repository_url"
    t.text   "description"
    t.index ["url"], name: "index_projects_on_url", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "uid"
    t.string   "name"
    t.string   "email"
    t.string   "image_url"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "token",      limit: 128
    t.string   "url",        limit: 64
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["uid"], name: "index_users_on_uid", using: :btree
  end

  add_foreign_key "commitments", "goals"
  add_foreign_key "commitments", "users"
  add_foreign_key "goals", "hackdays"
  add_foreign_key "goals", "projects"
  add_foreign_key "likes", "goals"
  add_foreign_key "likes", "users"
end
