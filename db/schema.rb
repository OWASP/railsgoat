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

ActiveRecord::Schema.define(:version => 20140408185601) do

  create_table "analytics", :force => true do |t|
    t.string   "ip_address"
    t.string   "referrer"
    t.string   "user_agent"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "benefits", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "key_managements", :force => true do |t|
    t.string   "iv"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "messages", :force => true do |t|
    t.integer  "creator_id"
    t.integer  "receiver_id"
    t.text     "message"
    t.boolean  "read"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "paid_time_offs", :force => true do |t|
    t.integer  "user_id"
    t.integer  "sick_days_taken"
    t.integer  "sick_days_earned"
    t.integer  "pto_taken"
    t.integer  "pto_earned"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "pays", :force => true do |t|
    t.integer  "user_id"
    t.string   "bank_account_num"
    t.string   "bank_routing_num"
    t.integer  "percent_of_deposit"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "performances", :force => true do |t|
    t.integer  "user_id"
    t.date     "date_submitted"
    t.integer  "score"
    t.string   "comments"
    t.integer  "reviewer"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "retirements", :force => true do |t|
    t.string   "total"
    t.string   "employee_contrib"
    t.string   "employer_contrib"
    t.integer  "user_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "schedules", :force => true do |t|
    t.string   "event_type"
    t.date     "date_begin"
    t.date     "date_end"
    t.string   "event_name"
    t.string   "event_desc"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password"
    t.boolean  "admin"
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "auth_token"
  end

  create_table "work_infos", :force => true do |t|
    t.integer  "user_id"
    t.string   "income"
    t.string   "bonuses"
    t.integer  "years_worked"
    t.string   "SSN"
    t.date     "DoB"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.binary   "encrypted_ssn"
  end

end
