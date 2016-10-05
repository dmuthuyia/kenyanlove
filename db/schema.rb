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

ActiveRecord::Schema.define(version: 20160926204639) do

  create_table "blogs", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.string   "url"
    t.text     "tags"
    t.integer  "category_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.integer  "user_id"
    t.string   "blog_img_file_name"
    t.string   "blog_img_content_type"
    t.integer  "blog_img_file_size"
    t.datetime "blog_img_updated_at"
  end

  create_table "cans", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "Gender"
    t.string   "FirstName"
    t.string   "LastName"
    t.string   "UserName"
    t.string   "Age"
    t.string   "City"
    t.string   "Country"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "Can_this_id"
    t.string   "email"
  end

  add_index "cans", ["user_id"], name: "index_cans_on_user_id"

  create_table "careers", force: :cascade do |t|
    t.string   "advertiser"
    t.string   "title"
    t.text     "description"
    t.text     "qualification"
    t.string   "contract_nature"
    t.decimal  "salary"
    t.datetime "start_date"
    t.datetime "application_deadline"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "career_img_file_name"
    t.string   "career_img_content_type"
    t.integer  "career_img_file_size"
    t.datetime "career_img_updated_at"
    t.integer  "user_id"
  end

  add_index "careers", ["user_id"], name: "index_careers_on_user_id"

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.text     "content"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "product_id"
  end

  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "contact_forms", force: :cascade do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "email"
    t.text     "message"
    t.string   "nickname"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "ontechnologies", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.string   "url"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.integer  "user_id"
    t.string   "ontechnology_img_file_name"
    t.string   "ontechnology_img_content_type"
    t.integer  "ontechnology_img_file_size"
    t.datetime "ontechnology_img_updated_at"
  end

  add_index "ontechnologies", ["user_id"], name: "index_ontechnologies_on_user_id"

  create_table "order_items", force: :cascade do |t|
    t.integer  "prod_id"
    t.integer  "order_id"
    t.decimal  "unit_price",  precision: 12, scale: 3
    t.integer  "quantity"
    t.decimal  "total_price", precision: 12, scale: 3
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  add_index "order_items", ["order_id"], name: "index_order_items_on_order_id"
  add_index "order_items", ["prod_id"], name: "index_order_items_on_prod_id"

  create_table "order_statuses", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.decimal  "subtotal",        precision: 12, scale: 3
    t.decimal  "tax",             precision: 12, scale: 3
    t.decimal  "shipping",        precision: 12, scale: 3
    t.decimal  "total",           precision: 12, scale: 3
    t.integer  "order_status_id"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  add_index "orders", ["order_status_id"], name: "index_orders_on_order_status_id"

  create_table "payments", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "last4"
    t.decimal  "amount",             precision: 12, scale: 3
    t.boolean  "success"
    t.string   "authorization_code"
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
  end

  create_table "pictures", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "user_id"
  end

  add_index "pictures", ["user_id"], name: "index_pictures_on_user_id"

  create_table "prods", force: :cascade do |t|
    t.string   "name"
    t.decimal  "price",      precision: 12, scale: 3
    t.boolean  "active"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  create_table "products", force: :cascade do |t|
    t.string   "title"
    t.string   "url"
    t.text     "description"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "price"
    t.string   "product_img_file_name"
    t.string   "product_img_content_type"
    t.integer  "product_img_file_size"
    t.datetime "product_img_updated_at"
    t.integer  "user_id"
  end

  add_index "products", ["user_id"], name: "index_products_on_user_id"

  create_table "send_us_mails", force: :cascade do |t|
    t.string   "FirstName"
    t.string   "LastName"
    t.string   "phone"
    t.string   "email"
    t.string   "subject"
    t.text     "message"
    t.string   "nickname"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "file1_file_name"
    t.string   "file1_content_type"
    t.integer  "file1_file_size"
    t.datetime "file1_updated_at"
    t.string   "file2_file_name"
    t.string   "file2_content_type"
    t.integer  "file2_file_size"
    t.datetime "file2_updated_at"
    t.string   "file3_file_name"
    t.string   "file3_content_type"
    t.integer  "file3_file_size"
    t.datetime "file3_updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "FirstName"
    t.string   "LastName"
    t.string   "UserName"
    t.datetime "date_of_birth"
    t.boolean  "is_female",              default: false
    t.string   "Age"
    t.string   "Race"
    t.boolean  "is_kenyan",              default: true
    t.string   "Country"
    t.string   "City"
    t.text     "LookingFor"
    t.text     "ShortBio"
    t.text     "LongBio"
    t.string   "Education"
    t.text     "Hobby"
    t.string   "Religion"
    t.boolean  "CanMove",                default: false
    t.string   "mypic_file_name"
    t.string   "mypic_content_type"
    t.integer  "mypic_file_size"
    t.datetime "mypic_updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "votes", force: :cascade do |t|
    t.integer  "votable_id"
    t.string   "votable_type"
    t.integer  "voter_id"
    t.string   "voter_type"
    t.boolean  "vote_flag"
    t.string   "vote_scope"
    t.integer  "vote_weight"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope"
  add_index "votes", ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope"

end
