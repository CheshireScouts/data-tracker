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

ActiveRecord::Schema.define(:version => 20130130101857) do

  create_table "award_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "awards", :force => true do |t|
    t.integer  "organisation_id"
    t.integer  "year_id"
    t.integer  "award_type_id"
    t.integer  "award_count"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "awards", ["award_type_id"], :name => "index_awards_on_award_type_id"
  add_index "awards", ["organisation_id"], :name => "index_awards_on_organisation_id"
  add_index "awards", ["year_id"], :name => "index_awards_on_year_id"

  create_table "membership_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "memberships", :force => true do |t|
    t.integer  "organisation_id"
    t.integer  "year_id"
    t.integer  "membership_type_id"
    t.string   "gender"
    t.integer  "head_count"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  add_index "memberships", ["membership_type_id"], :name => "index_memberships_on_membership_type_id"
  add_index "memberships", ["organisation_id"], :name => "index_memberships_on_organisation_id"
  add_index "memberships", ["year_id"], :name => "index_memberships_on_year_id"

  create_table "organisation_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "organisations", :force => true do |t|
    t.string   "name"
    t.integer  "organisation_type_id"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.string   "ancestry"
  end

  add_index "organisations", ["ancestry"], :name => "index_organisations_on_ancestry"
  add_index "organisations", ["organisation_type_id"], :name => "index_organisations_on_organisation_type_id"

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "roles", ["name", "resource_type", "resource_id"], :name => "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], :name => "index_roles_on_name"

  create_table "users", :force => true do |t|
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
    t.string   "name"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "users_roles", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], :name => "index_users_roles_on_user_id_and_role_id"

  create_table "years", :force => true do |t|
    t.integer  "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
