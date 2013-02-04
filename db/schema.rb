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

ActiveRecord::Schema.define(:version => 20130129102926) do

  create_table "abouts", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "active_admin_comments", :force => true do |t|
    t.string   "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "admin_users", :force => true do |t|
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

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true

  create_table "attachments", :force => true do |t|
    t.string   "image"
    t.integer  "attachable_id"
    t.string   "attachable_type"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "attachments", ["attachable_id"], :name => "index_attachments_on_attachable_id"

  create_table "attendances", :force => true do |t|
    t.integer  "employee_id"
    t.integer  "salary_id"
    t.boolean  "day_1"
    t.boolean  "day_2"
    t.boolean  "day_3"
    t.boolean  "day_4"
    t.boolean  "day_5"
    t.boolean  "day_6"
    t.boolean  "day_7"
    t.boolean  "day_8"
    t.boolean  "day_9"
    t.boolean  "day_10"
    t.boolean  "day_11"
    t.boolean  "day_12"
    t.boolean  "day_13"
    t.boolean  "day_14"
    t.boolean  "day_15"
    t.boolean  "day_16"
    t.boolean  "day_17"
    t.boolean  "day_18"
    t.boolean  "day_19"
    t.boolean  "day_20"
    t.boolean  "day_21"
    t.boolean  "day_22"
    t.boolean  "day_23"
    t.boolean  "day_24"
    t.boolean  "day_25"
    t.boolean  "day_26"
    t.boolean  "day_27"
    t.boolean  "day_28"
    t.boolean  "day_29"
    t.boolean  "day_30"
    t.boolean  "day_31"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "total"
    t.integer  "target_year"
    t.integer  "target_month"
  end

  create_table "branches", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "contacts", :force => true do |t|
    t.string   "title"
    t.string   "email"
    t.text     "address"
    t.string   "phone_no"
    t.string   "fax_no"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.float    "latitude"
    t.float    "longitude"
  end

  create_table "counter_orders", :force => true do |t|
    t.integer  "counter_id"
    t.integer  "item_id"
    t.integer  "quantity"
    t.integer  "status"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "counters", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "customers", :force => true do |t|
    t.integer  "serial_no"
    t.date     "date_of_transcation"
    t.float    "total"
    t.integer  "table_id"
    t.integer  "status"
    t.float    "adjusted_total"
    t.string   "adjustment_reason"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.integer  "counter_id"
  end

  create_table "deliveries", :force => true do |t|
    t.float    "cost"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "delivery_items", :force => true do |t|
    t.integer  "stock_list_item_id"
    t.integer  "delivery_id"
    t.float    "mrp"
    t.integer  "quantity"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.integer  "supplier_id"
    t.integer  "payment_status"
    t.integer  "user_id"
  end

  create_table "employees", :force => true do |t|
    t.integer  "position_id"
    t.integer  "branch_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "employee_no"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "galleries", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "images", :force => true do |t|
    t.string   "photo"
    t.integer  "imagable_id"
    t.string   "imagable_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "images", ["imagable_id"], :name => "index_images_on_imagable_id"

  create_table "internal_orders", :force => true do |t|
    t.integer  "kitchen_id"
    t.integer  "stock_list_item_id"
    t.integer  "quantity"
    t.integer  "status"
    t.integer  "user_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "items", :force => true do |t|
    t.string  "item_name"
    t.float   "price"
    t.text    "description"
    t.integer "category_id"
    t.integer "counter_id"
    t.integer "kitchen_id"
  end

  create_table "kitchens", :force => true do |t|
    t.string   "name"
    t.integer  "counter_id"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "orderlists", :force => true do |t|
    t.integer  "order_id"
    t.integer  "item_id"
    t.integer  "quantity"
    t.integer  "price"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.boolean  "cancel_item"
    t.integer  "counter_id"
    t.integer  "user_id"
    t.integer  "kitchen_id"
    t.integer  "status"
  end

  create_table "orders", :force => true do |t|
    t.integer  "customer_id"
    t.float    "total"
    t.integer  "status"
    t.integer  "price"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "counter_id"
  end

  create_table "paid_outs", :force => true do |t|
    t.float    "amount"
    t.string   "reason"
    t.string   "to"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "user_id"
  end

  create_table "positions", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "recipes", :force => true do |t|
    t.integer  "item_id"
    t.integer  "stock_list_item_id"
    t.float    "quantity"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "remaining_items", :force => true do |t|
    t.integer  "stock_list_item_id"
    t.integer  "stock_count_id"
    t.integer  "quantity"
    t.float    "mrp"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.integer  "user_id"
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "roles", ["name", "resource_type", "resource_id"], :name => "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], :name => "index_roles_on_name"

  create_table "salaries", :force => true do |t|
    t.integer  "working_days"
    t.float    "basic_salary"
    t.float    "travel_expense"
    t.float    "other_expense"
    t.float    "total_payable"
    t.float    "day_rate"
    t.float    "other_decuction"
    t.float    "net_payable"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "target_year"
    t.integer  "target_month"
    t.integer  "employee_id"
  end

  create_table "stock_counts", :force => true do |t|
    t.float    "cost"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "stock_list_items", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "suppliers", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "contact_name"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "swipe_cards", :force => true do |t|
    t.string   "card_no"
    t.float    "balance"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "user_id"
  end

  create_table "tables", :force => true do |t|
    t.integer "table_name"
  end

  create_table "taxes", :force => true do |t|
    t.string   "name"
    t.float    "percentage"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "transactions", :force => true do |t|
    t.integer  "swipe_card_id"
    t.string   "counter_id"
    t.float    "cost"
    t.integer  "type_of_transaction"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.float    "balance"
    t.integer  "user_id"
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
    t.string   "time_zone"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "users_roles", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], :name => "index_users_roles_on_user_id_and_role_id"

end
