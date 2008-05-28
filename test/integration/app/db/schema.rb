# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of ActiveRecord to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 11) do

  create_table "addresses", :force => true do |t|
    t.integer "user_id",                         :null => false
    t.string  "name"
    t.string  "line_1",          :default => "", :null => false
    t.string  "line_2"
    t.string  "city",            :default => "", :null => false
    t.integer "state_id",                        :null => false
    t.string  "province_region"
    t.string  "zip_postal_code"
    t.integer "country_id",                      :null => false
    t.float   "lat"
    t.float   "lng"
  end

  create_table "categories", :force => true do |t|
    t.string  "name",           :default => "", :null => false
    t.integer "parent_id"
    t.integer "children_count"
    t.string  "permalink"
  end

  create_table "categories_sellers", :id => false, :force => true do |t|
    t.integer "category_id", :null => false
    t.integer "seller_id",   :null => false
  end

  add_index "categories_sellers", ["category_id"], :name => "index_categories_sellers_on_category_id"
  add_index "categories_sellers", ["seller_id"], :name => "index_categories_sellers_on_seller_id"

  create_table "countries", :force => true do |t|
    t.string "name", :default => "", :null => false
  end

  create_table "sellers", :force => true do |t|
    t.integer  "user_id",                            :null => false
    t.string   "company_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "capitalization",    :default => 0.0
    t.string   "mission_statement"
  end

  create_table "states", :force => true do |t|
    t.string "name",         :default => "", :null => false
    t.string "abbreviation", :default => "", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "login",            :limit => 64, :default => "",    :null => false
    t.string   "email",                          :default => "",    :null => false
    t.string   "crypted_password", :limit => 64, :default => "",    :null => false
    t.string   "salt",             :limit => 64, :default => "",    :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "deleted",                        :default => false
  end

end
