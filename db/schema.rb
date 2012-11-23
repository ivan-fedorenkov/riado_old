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

ActiveRecord::Schema.define(:version => 20121123123512) do

  create_table "acols", :force => true do |t|
    t.string   "name",       :null => false
    t.integer  "region_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "acols", ["name"], :name => "index_acols_on_name", :unique => true

  create_table "advocates", :force => true do |t|
    t.string   "second_name"
    t.string   "first_name"
    t.string   "patronomic"
    t.string   "reg_num",     :null => false
    t.string   "status",      :null => false
    t.string   "sex"
    t.integer  "acol_id",     :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "advocates", ["reg_num"], :name => "index_advocates_on_reg_num", :unique => true
  add_index "advocates", ["second_name"], :name => "index_advocates_on_second_name"
  add_index "advocates", ["status"], :name => "index_advocates_on_status"

  create_table "regions", :force => true do |t|
    t.string  "name",                       :null => false
    t.boolean "default", :default => false
  end

  add_index "regions", ["name"], :name => "index_regions_on_name", :unique => true

end
