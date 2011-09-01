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

ActiveRecord::Schema.define(:version => 20110901225557) do

  create_table "comments", :force => true do |t|
    t.integer  "commentable_id",                      :null => false
    t.string   "commentable_type",                    :null => false
    t.string   "commenter_name"
    t.string   "commenter_email"
    t.text     "body",                                :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "hidden",           :default => false, :null => false
    t.boolean  "reviewed",         :default => false, :null => false
  end

  create_table "pages", :force => true do |t|
    t.string   "name"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "parent_id"
    t.boolean  "visible",     :default => true, :null => false
    t.integer  "lft",         :default => 0,    :null => false
    t.integer  "rgt",         :default => 0,    :null => false
    t.boolean  "commentable", :default => true, :null => false
  end

  add_index "pages", ["parent_id"], :name => "index_pages_on_parent_id"

end
