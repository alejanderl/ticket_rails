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

ActiveRecord::Schema.define(:version => 20121016101844) do

  create_table "addresses", :force => true do |t|
    t.string   "line1"
    t.string   "line2"
    t.integer  "postal_code"
    t.string   "city"
    t.string   "country"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "cinema_id"
    t.integer  "addressable_id"
    t.string   "addressable_type"
  end

  create_table "cinemas", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "image"
  end

  create_table "events", :force => true do |t|
    t.string   "name"
    t.datetime "date"
    t.integer  "stall_available"
    t.integer  "stall_reserve"
    t.integer  "stall_total"
    t.integer  "exception"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.integer  "room_id"
    t.integer  "show_id"
    t.datetime "end_date"
    t.decimal  "event_duration"
    t.string   "group_code"
    t.integer  "serie_id",        :default => 0
    t.string   "image"
  end

  create_table "films", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "genre"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "films_shows", :id => false, :force => true do |t|
    t.integer "film_id"
    t.integer "show_id"
  end

  create_table "rooms", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "repetition_rule"
    t.integer  "stall_total"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "theater_id"
  end

  create_table "selections", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "shows", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "content_related"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "theaters", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "image"
  end

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
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
