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

ActiveRecord::Schema.define(version: 20150703061141) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "language"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories_profiles", force: :cascade do |t|
    t.integer "profile_id"
    t.integer "category_id"
  end

  add_index "categories_profiles", ["category_id"], name: "index_categories_profiles_on_category_id", using: :btree
  add_index "categories_profiles", ["profile_id"], name: "index_categories_profiles_on_profile_id", using: :btree

  create_table "categories_projects", force: :cascade do |t|
    t.integer "category_id"
    t.integer "project_id"
  end

  add_index "categories_projects", ["category_id"], name: "index_categories_projects_on_category_id", using: :btree
  add_index "categories_projects", ["project_id"], name: "index_categories_projects_on_project_id", using: :btree

  create_table "profiles", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.text     "bio"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "github_URL"
  end

  create_table "profiles_projects", force: :cascade do |t|
    t.integer "profile_id"
    t.integer "project_id"
  end

  add_index "profiles_projects", ["profile_id"], name: "index_profiles_projects_on_profile_id", using: :btree
  add_index "profiles_projects", ["project_id"], name: "index_profiles_projects_on_project_id", using: :btree

  create_table "projects", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "repo_URL"
    t.string   "URL"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
