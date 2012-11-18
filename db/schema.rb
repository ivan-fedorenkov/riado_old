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

ActiveRecord::Schema.define(:version => 20121118095354) do

  create_table "acols", :id => false, :force => true do |t|
    t.string   "name",       :null => false
    t.integer  "region_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "acols", ["name"], :name => "index_acols_on_name", :unique => true
  add_index "acols", ["region_id"], :name => "index_acols_on_region_id", :unique => true

  create_table "advocates", :force => true do |t|
    t.string   "name"
    t.integer  "acol_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "regions", :force => true do |t|
    t.string  "name",                       :null => false
    t.boolean "default", :default => false
  end

  add_index "regions", ["name"], :name => "index_regions_on_name"

end
