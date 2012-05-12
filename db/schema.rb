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

ActiveRecord::Schema.define(:version => 20111220133443) do

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
    t.string   "name"         :default => "", :null => false
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

  create_table "users" do |t|
    ## Database authenticatable
    t.string :email,              :null => false, :default => ""
    t.string :encrypted_password, :null => false, :default => "", :limit => 128

    ## Recoverable
    t.string   :reset_password_token
    t.datetime :reset_password_sent_at

    ## Rememberable
    t.datetime :remember_created_at

    ## Trackable
    t.integer  :sign_in_count, :default => 0
    t.datetime :current_sign_in_at
    t.datetime :last_sign_in_at
    t.string   :current_sign_in_ip
    t.string   :last_sign_in_ip

    ## Encryptable
    t.string :password_salt

    ## Confirmable
    # t.string   :confirmation_token
    # t.datetime :confirmed_at
    # t.datetime :confirmation_sent_at
    # t.string   :unconfirmed_email # Only if using reconfirmable

    ## Lockable
    # t.integer  :failed_attempts, :default => 0 # Only if lock strategy is :failed_attempts
    # t.string   :unlock_token # Only if unlock strategy is :email or :both
    # t.datetime :locked_at

    # Token authenticatable
    t.string :authentication_token

    ## Invitable
    # t.string :invitation_token
    t.string   "username"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "name"
    
    t.timestamps
  end
 

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
