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

ActiveRecord::Schema.define(version: 20180118082513) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "award_nominations", force: true do |t|
    t.string   "award_name"
    t.string   "nominator_name"
    t.string   "nominator_phone"
    t.string   "nominator_email"
    t.string   "nominee_name"
    t.string   "nominee_address"
    t.string   "nominee_phone"
    t.string   "nominee_email"
    t.string   "nominee_title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "supporting_material_file_name"
    t.string   "supporting_material_content_type"
    t.integer  "supporting_material_file_size"
    t.datetime "supporting_material_updated_at"
    t.text     "reason_for_nomination"
    t.datetime "award_date"
  end

  create_table "blog_posts", force: true do |t|
    t.string   "post_title"
    t.string   "post_subtitle"
    t.string   "post_url_alias"
    t.text     "post_content"
    t.integer  "blog_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "featured_image_file_name"
  end

  add_index "blog_posts", ["blog_id"], name: "index_blog_posts_on_blog_id", using: :btree
  add_index "blog_posts", ["post_url_alias"], name: "index_blog_posts_on_post_url_alias", using: :btree

  create_table "blogs", force: true do |t|
    t.string   "blog_title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "blog_url_alias"
  end

  add_index "blogs", ["blog_url_alias"], name: "index_blogs_on_blog_url_alias", using: :btree

  create_table "callout_assignments", force: true do |t|
    t.integer "page_id"
    t.integer "callout_id"
    t.integer "order_num",  default: 0
  end

  add_index "callout_assignments", ["callout_id"], name: "index_callout_assignments_on_callout_id", using: :btree
  add_index "callout_assignments", ["page_id"], name: "index_callout_assignments_on_page_id", using: :btree

  create_table "callouts", force: true do |t|
    t.string   "callout_title"
    t.text     "callout_content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "callouts_pages", force: true do |t|
    t.integer "page_id"
    t.integer "callout_id"
  end

  create_table "ckeditor_assets", force: true do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable", using: :btree
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type", using: :btree

  create_table "faculty_propsels", force: true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "city"
    t.string   "office_phone"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "area_of_expertise"
    t.string   "limitations"
    t.string   "program_title"
    t.string   "area"
    t.string   "program_length"
    t.string   "activity_based"
    t.string   "brief_summary"
    t.string   "state"
    t.string   "zip"
    t.string   "mobile_phone"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "intrested_memeber"
    t.string   "evidence"
  end

  create_table "journal_articles", force: true do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "email"
    t.string   "article_title"
    t.string   "abstract"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "member_momenta", force: true do |t|
    t.string   "name"
    t.text     "about_recognition"
    t.datetime "momentum_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
    t.string   "member_attachment_file_name"
  end

  create_table "pages", force: true do |t|
    t.string   "page_title"
    t.string   "url_alias"
    t.integer  "template_id"
    t.string   "meta_keywords"
    t.string   "meta_description"
    t.text     "page_content"
    t.integer  "parent_page_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "order_num",              default: 0
    t.boolean  "include_in_header_menu"
    t.boolean  "include_in_footer_menu"
    t.boolean  "is_redirect"
    t.string   "redirect_url"
    t.boolean  "is_members_only"
    t.boolean  "is_homepage"
    t.string   "meta_title"
    t.boolean  "is_private"
  end

  add_index "pages", ["parent_page_id"], name: "index_pages_on_parent_page_id", using: :btree
  add_index "pages", ["template_id"], name: "index_pages_on_template_id", using: :btree
  add_index "pages", ["url_alias"], name: "index_pages_on_url_alias", using: :btree

  create_table "proposel_documents", force: true do |t|
    t.string   "document_file_name"
    t.string   "document_content_type"
    t.integer  "document_file_size"
    t.datetime "document_updated_at"
    t.integer  "faculty_propsel_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "settings", force: true do |t|
    t.string   "setting_name"
    t.text     "setting_value"
    t.string   "setting_attachment_file_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "requires_file"
  end

  add_index "settings", ["setting_name"], name: "index_settings_on_setting_name", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "roles"
    t.string   "membee_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
