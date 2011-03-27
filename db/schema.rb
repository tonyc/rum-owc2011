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

ActiveRecord::Schema.define(:version => 20110327083706) do

  create_table "applicants", :force => true do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "email"
    t.string   "race"
    t.string   "dob"
    t.string   "weight"
    t.string   "height"
    t.string   "occupation"
    t.string   "guardian"
    t.string   "guardian_address"
    t.string   "guardian_city"
    t.string   "guardian_state"
    t.string   "guardian_zip"
    t.string   "guardian_phone"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "status"
  end

  add_index "applicants", ["id"], :name => "index_applicants_on_id"

  create_table "campaigns", :force => true do |t|
    t.string   "name"
    t.text     "success_story"
    t.string   "year"
    t.integer  "before_image_1_id"
    t.integer  "before_image_2_id"
    t.integer  "after_image_1_id"
    t.integer  "after_image_2_id"
    t.integer  "after_image_3_id"
    t.float    "target_level"
    t.string   "status"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "active"
    t.integer  "applicant_id"
  end

  add_index "campaigns", ["id"], :name => "index_campaigns_on_id"

  create_table "campaigns_contacts", :id => false, :force => true do |t|
    t.integer "campaign_id"
    t.integer "contact_id"
  end

  create_table "contacts", :force => true do |t|
    t.string   "last_name"
    t.string   "first_name"
    t.string   "company"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email_address"
  end

  create_table "donation_tags", :force => true do |t|
    t.integer "contact_id"
    t.integer "year"
  end

  create_table "images", :force => true do |t|
    t.string   "image_mime_type"
    t.string   "image_name"
    t.integer  "image_size"
    t.integer  "image_width"
    t.integer  "image_height"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_uid"
    t.string   "image_ext"
  end

  create_table "notes", :force => true do |t|
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "applicant_id"
  end

  create_table "page_part_translations", :force => true do |t|
    t.integer  "page_part_id"
    t.string   "locale"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "page_part_translations", ["page_part_id"], :name => "index_page_part_translations_on_page_part_id"

  create_table "page_parts", :force => true do |t|
    t.integer  "page_id"
    t.string   "title"
    t.text     "body"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "page_parts", ["id"], :name => "index_page_parts_on_id"
  add_index "page_parts", ["page_id"], :name => "index_page_parts_on_page_id"

  create_table "page_translations", :force => true do |t|
    t.integer  "page_id"
    t.string   "locale"
    t.string   "meta_keywords"
    t.text     "meta_description"
    t.string   "browser_title"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "page_translations", ["page_id"], :name => "index_page_translations_on_page_id"

  create_table "pages", :force => true do |t|
    t.string   "title"
    t.integer  "parent_id"
    t.integer  "position"
    t.string   "path"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "meta_keywords"
    t.text     "meta_description"
    t.boolean  "show_in_menu",        :default => true
    t.string   "link_url"
    t.string   "menu_match"
    t.boolean  "deletable",           :default => true
    t.string   "custom_title"
    t.string   "custom_title_type",   :default => "none"
    t.boolean  "draft",               :default => false
    t.string   "browser_title"
    t.boolean  "skip_to_first_child", :default => false
    t.integer  "lft"
    t.integer  "rgt"
    t.integer  "depth"
  end

  add_index "pages", ["depth"], :name => "index_pages_on_depth"
  add_index "pages", ["id"], :name => "index_pages_on_id"
  add_index "pages", ["lft"], :name => "index_pages_on_lft"
  add_index "pages", ["parent_id"], :name => "index_pages_on_parent_id"
  add_index "pages", ["rgt"], :name => "index_pages_on_rgt"

  create_table "payments", :force => true do |t|
    t.float    "amount"
    t.integer  "campaign_id"
    t.string   "transaction_id"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "payments", ["id"], :name => "index_payments_on_id"

  create_table "products", :force => true do |t|
    t.string   "name"
    t.string   "short_description"
    t.text     "description"
    t.string   "price"
    t.boolean  "purchased"
    t.boolean  "published"
    t.integer  "transaction_id"
    t.integer  "image_id"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "products", ["id"], :name => "index_products_on_id"
  add_index "products", ["image_id"], :name => "index_products_on_image_id"

  create_table "recipients", :force => true do |t|
    t.string   "name"
    t.text     "story"
    t.string   "year"
    t.integer  "image_id"
    t.integer  "amount_needed"
    t.integer  "amount_received"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "active"
  end

  add_index "recipients", ["id"], :name => "index_recipients_on_id"

  create_table "refinery_settings", :force => true do |t|
    t.string   "name"
    t.text     "value"
    t.boolean  "destroyable",             :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "scoping"
    t.boolean  "restricted",              :default => false
    t.string   "callback_proc_as_string"
    t.string   "form_value_type"
  end

  add_index "refinery_settings", ["name"], :name => "index_refinery_settings_on_name"

  create_table "resources", :force => true do |t|
    t.string   "file_mime_type"
    t.string   "file_name"
    t.integer  "file_size"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "file_uid"
    t.string   "file_ext"
  end

  create_table "roles", :force => true do |t|
    t.string "title"
  end

  create_table "roles_users", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "roles_users", ["role_id", "user_id"], :name => "index_roles_users_on_role_id_and_user_id"
  add_index "roles_users", ["user_id", "role_id"], :name => "index_roles_users_on_user_id_and_role_id"

  create_table "slugs", :force => true do |t|
    t.string   "name"
    t.integer  "sluggable_id"
    t.integer  "sequence",                     :default => 1, :null => false
    t.string   "sluggable_type", :limit => 40
    t.string   "scope",          :limit => 40
    t.datetime "created_at"
    t.string   "locale"
  end

  add_index "slugs", ["locale"], :name => "index_slugs_on_locale"
  add_index "slugs", ["name", "sluggable_type", "scope", "sequence"], :name => "index_slugs_on_n_s_s_and_s", :unique => true
  add_index "slugs", ["sluggable_id"], :name => "index_slugs_on_sluggable_id"

  create_table "user_plugins", :force => true do |t|
    t.integer "user_id"
    t.string  "name"
    t.integer "position"
  end

  add_index "user_plugins", ["name"], :name => "index_user_plugins_on_title"
  add_index "user_plugins", ["user_id", "name"], :name => "index_unique_user_plugins", :unique => true

  create_table "users", :force => true do |t|
    t.string   "username",             :null => false
    t.string   "email",                :null => false
    t.string   "encrypted_password",   :null => false
    t.string   "password_salt",        :null => false
    t.string   "persistence_token"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "perishable_token"
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "sign_in_count"
    t.string   "remember_token"
    t.string   "reset_password_token"
    t.datetime "remember_created_at"
  end

  add_index "users", ["id"], :name => "index_users_on_id"

end
