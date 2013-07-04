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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130703133633) do

  create_table "commits", :force => true do |t|
    t.string   "sha"
    t.string   "html_url"
    t.datetime "commit_date"
    t.string   "committer_name"
    t.string   "committer_email"
    t.datetime "author_date"
    t.string   "author_name"
    t.string   "author_email"
    t.integer  "project_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "contributes", :force => true do |t|
    t.integer  "user_id"
    t.string   "score"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "members", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
  end

  add_index "members", ["email"], :name => "index_members_on_email", :unique => true
  add_index "members", ["reset_password_token"], :name => "index_members_on_reset_password_token", :unique => true

  create_table "projects", :force => true do |t|
    t.string   "uid"
    t.string   "name"
    t.string   "description"
    t.string   "html_url"
    t.string   "avatar_url"
    t.string   "starred_url"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "login"
    t.integer  "followers"
    t.integer  "following"
    t.string   "avatar_url"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "github_id"
    t.string   "fullname"
    t.string   "location"
    t.string   "language"
    t.string   "username"
    t.float    "score"
  end

end
