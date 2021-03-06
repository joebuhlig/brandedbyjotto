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

ActiveRecord::Schema.define(version: 20160216184341) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "alchemy_users", force: :cascade do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "login"
    t.string   "email"
    t.string   "gender"
    t.string   "language"
    t.string   "encrypted_password",     limit: 128, default: "",       null: false
    t.string   "password_salt",          limit: 128, default: "",       null: false
    t.integer  "sign_in_count",                      default: 0,        null: false
    t.integer  "failed_attempts",                    default: 0,        null: false
    t.datetime "last_request_at"
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                            null: false
    t.datetime "updated_at",                                            null: false
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.text     "cached_tag_list"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.string   "alchemy_roles",                      default: "member"
  end

  add_index "alchemy_users", ["alchemy_roles"], name: "index_alchemy_users_on_alchemy_roles", using: :btree
  add_index "alchemy_users", ["email"], name: "index_alchemy_users_on_email", unique: true, using: :btree
  add_index "alchemy_users", ["firstname"], name: "index_alchemy_users_on_firstname", using: :btree
  add_index "alchemy_users", ["lastname"], name: "index_alchemy_users_on_lastname", using: :btree
  add_index "alchemy_users", ["login"], name: "index_alchemy_users_on_login", unique: true, using: :btree
  add_index "alchemy_users", ["reset_password_token"], name: "index_alchemy_users_on_reset_password_token", unique: true, using: :btree

  create_table "blogit_comments", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "email",      null: false
    t.string   "website"
    t.text     "body",       null: false
    t.integer  "post_id",    null: false
    t.string   "state"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "blogit_comments", ["post_id"], name: "index_blogit_comments_on_post_id", using: :btree

  create_table "blogit_posts", force: :cascade do |t|
    t.string   "title",                            null: false
    t.text     "body",                             null: false
    t.string   "state",          default: "draft", null: false
    t.integer  "comments_count", default: 0,       null: false
    t.integer  "blogger_id"
    t.string   "blogger_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
  end

  add_index "blogit_posts", ["blogger_type", "blogger_id"], name: "index_blogit_posts_on_blogger_type_and_blogger_id", using: :btree

  create_table "blogo_posts", force: :cascade do |t|
    t.integer  "user_id",          null: false
    t.string   "permalink",        null: false
    t.string   "title",            null: false
    t.boolean  "published",        null: false
    t.datetime "published_at",     null: false
    t.string   "markup_lang",      null: false
    t.text     "raw_content",      null: false
    t.text     "html_content",     null: false
    t.text     "html_overview"
    t.string   "tags_string"
    t.string   "meta_description", null: false
    t.string   "meta_image"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "blogo_posts", ["permalink"], name: "index_blogo_posts_on_permalink", unique: true, using: :btree
  add_index "blogo_posts", ["published_at"], name: "index_blogo_posts_on_published_at", using: :btree
  add_index "blogo_posts", ["user_id"], name: "index_blogo_posts_on_user_id", using: :btree

  create_table "blogo_taggings", force: :cascade do |t|
    t.integer "post_id", null: false
    t.integer "tag_id",  null: false
  end

  add_index "blogo_taggings", ["tag_id", "post_id"], name: "index_blogo_taggings_on_tag_id_and_post_id", unique: true, using: :btree

  create_table "blogo_tags", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "blogo_tags", ["name"], name: "index_blogo_tags_on_name", unique: true, using: :btree

  create_table "blogo_users", force: :cascade do |t|
    t.string   "name",            null: false
    t.string   "email",           null: false
    t.string   "password_digest", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "blogo_users", ["email"], name: "index_blogo_users_on_email", unique: true, using: :btree

  create_table "comments", force: :cascade do |t|
    t.integer  "commentable_id",   default: 0
    t.string   "commentable_type", default: ""
    t.string   "title",            default: ""
    t.text     "body"
    t.string   "subject",          default: ""
    t.integer  "user_id",          default: 0,  null: false
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["commentable_id"], name: "index_comments_on_commentable_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
    t.datetime "deleted_at"
  end

  add_index "friendly_id_slugs", ["deleted_at"], name: "index_friendly_id_slugs_on_deleted_at", using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "refinery_authentication_devise_roles", force: :cascade do |t|
    t.string "title"
  end

  create_table "refinery_authentication_devise_roles_users", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "refinery_authentication_devise_roles_users", ["role_id", "user_id"], name: "refinery_roles_users_role_id_user_id", using: :btree
  add_index "refinery_authentication_devise_roles_users", ["user_id", "role_id"], name: "refinery_roles_users_user_id_role_id", using: :btree

  create_table "refinery_authentication_devise_user_plugins", force: :cascade do |t|
    t.integer "user_id"
    t.string  "name"
    t.integer "position"
  end

  add_index "refinery_authentication_devise_user_plugins", ["name"], name: "index_refinery_authentication_devise_user_plugins_on_name", using: :btree
  add_index "refinery_authentication_devise_user_plugins", ["user_id", "name"], name: "refinery_user_plugins_user_id_name", unique: true, using: :btree

  create_table "refinery_authentication_devise_users", force: :cascade do |t|
    t.string   "username",                          null: false
    t.string   "email",                             null: false
    t.string   "encrypted_password",                null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "sign_in_count"
    t.datetime "remember_created_at"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
    t.string   "full_name"
    t.string   "spree_api_key",          limit: 48
    t.integer  "ship_address_id"
    t.integer  "bill_address_id"
  end

  add_index "refinery_authentication_devise_users", ["id"], name: "index_refinery_authentication_devise_users_on_id", using: :btree
  add_index "refinery_authentication_devise_users", ["slug"], name: "index_refinery_authentication_devise_users_on_slug", using: :btree

  create_table "refinery_blog_categories", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
  end

  add_index "refinery_blog_categories", ["id"], name: "index_refinery_blog_categories_on_id", using: :btree
  add_index "refinery_blog_categories", ["slug"], name: "index_refinery_blog_categories_on_slug", using: :btree

  create_table "refinery_blog_categories_blog_posts", force: :cascade do |t|
    t.integer "blog_category_id"
    t.integer "blog_post_id"
  end

  add_index "refinery_blog_categories_blog_posts", ["blog_category_id", "blog_post_id"], name: "index_blog_categories_blog_posts_on_bc_and_bp", using: :btree

  create_table "refinery_blog_category_translations", force: :cascade do |t|
    t.integer  "refinery_blog_category_id", null: false
    t.string   "locale",                    null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "title"
    t.string   "slug"
  end

  add_index "refinery_blog_category_translations", ["locale"], name: "index_refinery_blog_category_translations_on_locale", using: :btree
  add_index "refinery_blog_category_translations", ["refinery_blog_category_id"], name: "index_a0315945e6213bbe0610724da0ee2de681b77c31", using: :btree

  create_table "refinery_blog_comments", force: :cascade do |t|
    t.integer  "blog_post_id"
    t.boolean  "spam"
    t.string   "name"
    t.string   "email"
    t.text     "body"
    t.string   "state"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "refinery_blog_comments", ["blog_post_id"], name: "index_refinery_blog_comments_on_blog_post_id", using: :btree
  add_index "refinery_blog_comments", ["id"], name: "index_refinery_blog_comments_on_id", using: :btree

  create_table "refinery_blog_post_translations", force: :cascade do |t|
    t.integer  "refinery_blog_post_id", null: false
    t.string   "locale",                null: false
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.text     "body"
    t.text     "custom_teaser"
    t.string   "custom_url"
    t.string   "slug"
    t.string   "title"
  end

  add_index "refinery_blog_post_translations", ["locale"], name: "index_refinery_blog_post_translations_on_locale", using: :btree
  add_index "refinery_blog_post_translations", ["refinery_blog_post_id"], name: "index_refinery_blog_post_translations_on_refinery_blog_post_id", using: :btree

  create_table "refinery_blog_posts", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.boolean  "draft"
    t.datetime "published_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "custom_url"
    t.text     "custom_teaser"
    t.string   "source_url"
    t.string   "source_url_title"
    t.integer  "access_count",     default: 0
    t.string   "slug"
  end

  add_index "refinery_blog_posts", ["access_count"], name: "index_refinery_blog_posts_on_access_count", using: :btree
  add_index "refinery_blog_posts", ["id"], name: "index_refinery_blog_posts_on_id", using: :btree
  add_index "refinery_blog_posts", ["slug"], name: "index_refinery_blog_posts_on_slug", using: :btree

  create_table "refinery_image_translations", force: :cascade do |t|
    t.integer  "refinery_image_id", null: false
    t.string   "locale",            null: false
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "image_alt"
    t.string   "image_title"
  end

  add_index "refinery_image_translations", ["locale"], name: "index_refinery_image_translations_on_locale", using: :btree
  add_index "refinery_image_translations", ["refinery_image_id"], name: "index_refinery_image_translations_on_refinery_image_id", using: :btree

  create_table "refinery_images", force: :cascade do |t|
    t.string   "image_mime_type"
    t.string   "image_name"
    t.integer  "image_size"
    t.integer  "image_width"
    t.integer  "image_height"
    t.string   "image_uid"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_title"
    t.string   "image_alt"
  end

  create_table "refinery_page_part_translations", force: :cascade do |t|
    t.integer  "refinery_page_part_id", null: false
    t.string   "locale",                null: false
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.text     "body"
  end

  add_index "refinery_page_part_translations", ["locale"], name: "index_refinery_page_part_translations_on_locale", using: :btree
  add_index "refinery_page_part_translations", ["refinery_page_part_id"], name: "index_refinery_page_part_translations_on_refinery_page_part_id", using: :btree

  create_table "refinery_page_parts", force: :cascade do |t|
    t.integer  "refinery_page_id"
    t.string   "slug"
    t.text     "body"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
  end

  add_index "refinery_page_parts", ["id"], name: "index_refinery_page_parts_on_id", using: :btree
  add_index "refinery_page_parts", ["refinery_page_id"], name: "index_refinery_page_parts_on_refinery_page_id", using: :btree

  create_table "refinery_page_translations", force: :cascade do |t|
    t.integer  "refinery_page_id", null: false
    t.string   "locale",           null: false
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "title"
    t.string   "custom_slug"
    t.string   "menu_title"
    t.string   "slug"
  end

  add_index "refinery_page_translations", ["locale"], name: "index_refinery_page_translations_on_locale", using: :btree
  add_index "refinery_page_translations", ["refinery_page_id"], name: "index_refinery_page_translations_on_refinery_page_id", using: :btree

  create_table "refinery_pages", force: :cascade do |t|
    t.integer  "parent_id"
    t.string   "path"
    t.string   "slug"
    t.string   "custom_slug"
    t.boolean  "show_in_menu",        default: true
    t.string   "link_url"
    t.string   "menu_match"
    t.boolean  "deletable",           default: true
    t.boolean  "draft",               default: false
    t.boolean  "skip_to_first_child", default: false
    t.integer  "lft"
    t.integer  "rgt"
    t.integer  "depth"
    t.string   "view_template"
    t.string   "layout_template"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "refinery_pages", ["depth"], name: "index_refinery_pages_on_depth", using: :btree
  add_index "refinery_pages", ["id"], name: "index_refinery_pages_on_id", using: :btree
  add_index "refinery_pages", ["lft"], name: "index_refinery_pages_on_lft", using: :btree
  add_index "refinery_pages", ["parent_id"], name: "index_refinery_pages_on_parent_id", using: :btree
  add_index "refinery_pages", ["rgt"], name: "index_refinery_pages_on_rgt", using: :btree

  create_table "refinery_resource_translations", force: :cascade do |t|
    t.integer  "refinery_resource_id", null: false
    t.string   "locale",               null: false
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "resource_title"
  end

  add_index "refinery_resource_translations", ["locale"], name: "index_refinery_resource_translations_on_locale", using: :btree
  add_index "refinery_resource_translations", ["refinery_resource_id"], name: "index_refinery_resource_translations_on_refinery_resource_id", using: :btree

  create_table "refinery_resources", force: :cascade do |t|
    t.string   "file_mime_type"
    t.string   "file_name"
    t.integer  "file_size"
    t.string   "file_uid"
    t.string   "file_ext"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "refinery_settings", force: :cascade do |t|
    t.string   "name"
    t.text     "value"
    t.boolean  "destroyable",     default: true
    t.string   "scoping"
    t.boolean  "restricted",      default: false
    t.string   "form_value_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
    t.string   "title"
  end

  add_index "refinery_settings", ["name"], name: "index_refinery_settings_on_name", using: :btree

  create_table "seo_meta", force: :cascade do |t|
    t.integer  "seo_meta_id"
    t.string   "seo_meta_type"
    t.string   "browser_title"
    t.text     "meta_description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "seo_meta", ["id"], name: "index_seo_meta_on_id", using: :btree
  add_index "seo_meta", ["seo_meta_id", "seo_meta_type"], name: "id_type_index_on_seo_meta", using: :btree

  create_table "spree_ad_hoc_option_types", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "option_type_id"
    t.string   "price_modifier_type"
    t.boolean  "is_required",         default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position",            default: 0
  end

  create_table "spree_ad_hoc_option_values", force: :cascade do |t|
    t.integer  "ad_hoc_option_type_id"
    t.integer  "option_value_id"
    t.decimal  "price_modifier",        precision: 8, scale: 2, default: 0.0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position"
    t.boolean  "selected"
    t.decimal  "cost_price_modifier",   precision: 8, scale: 2
  end

  create_table "spree_ad_hoc_option_values_line_items", force: :cascade do |t|
    t.integer  "line_item_id"
    t.integer  "ad_hoc_option_value_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "spree_ad_hoc_variant_exclusions", force: :cascade do |t|
    t.integer  "product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "spree_addresses", force: :cascade do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "zipcode"
    t.string   "phone"
    t.string   "state_name"
    t.string   "alternative_phone"
    t.string   "company"
    t.integer  "state_id"
    t.integer  "country_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "spree_addresses", ["country_id"], name: "index_spree_addresses_on_country_id", using: :btree
  add_index "spree_addresses", ["firstname"], name: "index_addresses_on_firstname", using: :btree
  add_index "spree_addresses", ["lastname"], name: "index_addresses_on_lastname", using: :btree
  add_index "spree_addresses", ["state_id"], name: "index_spree_addresses_on_state_id", using: :btree

  create_table "spree_adjustments", force: :cascade do |t|
    t.integer  "source_id"
    t.string   "source_type"
    t.integer  "adjustable_id"
    t.string   "adjustable_type"
    t.decimal  "amount",          precision: 10, scale: 2
    t.string   "label"
    t.boolean  "mandatory"
    t.boolean  "eligible",                                 default: true
    t.datetime "created_at",                                               null: false
    t.datetime "updated_at",                                               null: false
    t.string   "state"
    t.integer  "order_id",                                                 null: false
    t.boolean  "included",                                 default: false
  end

  add_index "spree_adjustments", ["adjustable_id", "adjustable_type"], name: "index_spree_adjustments_on_adjustable_id_and_adjustable_type", using: :btree
  add_index "spree_adjustments", ["eligible"], name: "index_spree_adjustments_on_eligible", using: :btree
  add_index "spree_adjustments", ["order_id"], name: "index_spree_adjustments_on_order_id", using: :btree
  add_index "spree_adjustments", ["source_id", "source_type"], name: "index_spree_adjustments_on_source_id_and_source_type", using: :btree

  create_table "spree_assemblies_parts", force: :cascade do |t|
    t.integer "assembly_id",                            null: false
    t.integer "part_id",                                null: false
    t.integer "count",                      default: 1, null: false
    t.boolean "variant_selection_deferred"
  end

  create_table "spree_assets", force: :cascade do |t|
    t.integer  "viewable_id"
    t.string   "viewable_type"
    t.integer  "attachment_width"
    t.integer  "attachment_height"
    t.integer  "attachment_file_size"
    t.integer  "position"
    t.string   "attachment_content_type"
    t.string   "attachment_file_name"
    t.string   "type",                    limit: 75
    t.datetime "attachment_updated_at"
    t.text     "alt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "spree_assets", ["viewable_id"], name: "index_assets_on_viewable_id", using: :btree
  add_index "spree_assets", ["viewable_type", "type"], name: "index_assets_on_viewable_type_and_type", using: :btree

  create_table "spree_blogs", force: :cascade do |t|
    t.string   "name"
    t.string   "slug"
    t.string   "tag_title"
    t.string   "meta_description"
    t.string   "meta_keywords"
    t.text     "description"
    t.text     "content"
    t.string   "link"
    t.string   "type"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_update_at"
    t.integer  "image_width"
    t.integer  "image_height"
    t.integer  "position"
    t.date     "from"
    t.date     "to"
    t.boolean  "active",             default: false
    t.datetime "published_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "spree_blogs", ["slug"], name: "index_spree_blogs_on_slug", unique: true, using: :btree

  create_table "spree_calculators", force: :cascade do |t|
    t.string   "type"
    t.integer  "calculable_id"
    t.string   "calculable_type"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.text     "preferences"
    t.datetime "deleted_at"
  end

  add_index "spree_calculators", ["calculable_id", "calculable_type"], name: "index_spree_calculators_on_calculable_id_and_calculable_type", using: :btree
  add_index "spree_calculators", ["deleted_at"], name: "index_spree_calculators_on_deleted_at", using: :btree
  add_index "spree_calculators", ["id", "type"], name: "index_spree_calculators_on_id_and_type", using: :btree

  create_table "spree_countries", force: :cascade do |t|
    t.string   "iso_name"
    t.string   "iso"
    t.string   "iso3"
    t.string   "name"
    t.integer  "numcode"
    t.boolean  "states_required", default: false
    t.datetime "updated_at"
  end

  create_table "spree_credit_cards", force: :cascade do |t|
    t.string   "month"
    t.string   "year"
    t.string   "cc_type"
    t.string   "last_digits"
    t.integer  "address_id"
    t.string   "gateway_customer_profile_id"
    t.string   "gateway_payment_profile_id"
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.string   "name"
    t.integer  "user_id"
    t.integer  "payment_method_id"
    t.boolean  "default",                     default: false, null: false
  end

  add_index "spree_credit_cards", ["address_id"], name: "index_spree_credit_cards_on_address_id", using: :btree
  add_index "spree_credit_cards", ["payment_method_id"], name: "index_spree_credit_cards_on_payment_method_id", using: :btree
  add_index "spree_credit_cards", ["user_id"], name: "index_spree_credit_cards_on_user_id", using: :btree

  create_table "spree_customer_returns", force: :cascade do |t|
    t.string   "number"
    t.integer  "stock_location_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "spree_customizable_product_options", force: :cascade do |t|
    t.integer  "product_customization_type_id"
    t.integer  "position"
    t.string   "presentation",                  null: false
    t.string   "name",                          null: false
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "spree_customized_product_options", force: :cascade do |t|
    t.integer  "product_customization_id"
    t.integer  "customizable_product_option_id"
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "customization_image"
  end

  create_table "spree_excluded_ad_hoc_option_values", force: :cascade do |t|
    t.integer "ad_hoc_variant_exclusion_id"
    t.integer "ad_hoc_option_value_id"
  end

  create_table "spree_feedback_reviews", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "review_id",                 null: false
    t.integer  "rating",     default: 0
    t.text     "comment"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "locale",     default: "en"
  end

  add_index "spree_feedback_reviews", ["review_id"], name: "index_spree_feedback_reviews_on_review_id", using: :btree
  add_index "spree_feedback_reviews", ["user_id"], name: "index_spree_feedback_reviews_on_user_id", using: :btree

  create_table "spree_gateways", force: :cascade do |t|
    t.string   "type"
    t.string   "name"
    t.text     "description"
    t.boolean  "active",      default: true
    t.string   "environment", default: "development"
    t.string   "server",      default: "test"
    t.boolean  "test_mode",   default: true
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.text     "preferences"
  end

  add_index "spree_gateways", ["active"], name: "index_spree_gateways_on_active", using: :btree
  add_index "spree_gateways", ["test_mode"], name: "index_spree_gateways_on_test_mode", using: :btree

  create_table "spree_inventory_units", force: :cascade do |t|
    t.string   "state"
    t.integer  "variant_id"
    t.integer  "order_id"
    t.integer  "shipment_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.boolean  "pending",      default: true
    t.integer  "line_item_id"
  end

  add_index "spree_inventory_units", ["line_item_id"], name: "index_spree_inventory_units_on_line_item_id", using: :btree
  add_index "spree_inventory_units", ["order_id"], name: "index_inventory_units_on_order_id", using: :btree
  add_index "spree_inventory_units", ["shipment_id"], name: "index_inventory_units_on_shipment_id", using: :btree
  add_index "spree_inventory_units", ["variant_id"], name: "index_inventory_units_on_variant_id", using: :btree

  create_table "spree_line_item_personalizations", force: :cascade do |t|
    t.integer  "line_item_id"
    t.string   "name"
    t.decimal  "price",        precision: 8, scale: 2
    t.string   "currency"
    t.text     "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "spree_line_item_personalizations", ["line_item_id"], name: "index_spree_line_item_personalizations_on_line_item_id", using: :btree

  create_table "spree_line_items", force: :cascade do |t|
    t.integer  "variant_id"
    t.integer  "order_id"
    t.integer  "quantity",                                                            null: false
    t.decimal  "price",                        precision: 10, scale: 2,               null: false
    t.datetime "created_at",                                                          null: false
    t.datetime "updated_at",                                                          null: false
    t.string   "currency"
    t.decimal  "cost_price",                   precision: 10, scale: 2
    t.integer  "tax_category_id"
    t.decimal  "adjustment_total",             precision: 10, scale: 2, default: 0.0
    t.decimal  "additional_tax_total",         precision: 10, scale: 2, default: 0.0
    t.decimal  "promo_total",                  precision: 10, scale: 2, default: 0.0
    t.decimal  "included_tax_total",           precision: 10, scale: 2, default: 0.0, null: false
    t.decimal  "pre_tax_amount",               precision: 12, scale: 4, default: 0.0, null: false
    t.decimal  "taxable_adjustment_total",     precision: 10, scale: 2, default: 0.0, null: false
    t.decimal  "non_taxable_adjustment_total", precision: 10, scale: 2, default: 0.0, null: false
  end

  add_index "spree_line_items", ["order_id"], name: "index_spree_line_items_on_order_id", using: :btree
  add_index "spree_line_items", ["tax_category_id"], name: "index_spree_line_items_on_tax_category_id", using: :btree
  add_index "spree_line_items", ["variant_id"], name: "index_spree_line_items_on_variant_id", using: :btree

  create_table "spree_log_entries", force: :cascade do |t|
    t.integer  "source_id"
    t.string   "source_type"
    t.text     "details"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "spree_log_entries", ["source_id", "source_type"], name: "index_spree_log_entries_on_source_id_and_source_type", using: :btree

  create_table "spree_option_type_prototypes", id: false, force: :cascade do |t|
    t.integer "prototype_id"
    t.integer "option_type_id"
  end

  add_index "spree_option_type_prototypes", ["option_type_id"], name: "index_spree_option_type_prototypes_on_option_type_id", using: :btree
  add_index "spree_option_type_prototypes", ["prototype_id", "option_type_id"], name: "index_option_types_prototypes_on_prototype_and_option_type", using: :btree

  create_table "spree_option_types", force: :cascade do |t|
    t.string   "name",         limit: 100
    t.string   "presentation", limit: 100
    t.integer  "position",                 default: 0, null: false
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  add_index "spree_option_types", ["position"], name: "index_spree_option_types_on_position", using: :btree

  create_table "spree_option_value_variants", id: false, force: :cascade do |t|
    t.integer "variant_id"
    t.integer "option_value_id"
  end

  add_index "spree_option_value_variants", ["option_value_id"], name: "index_spree_option_value_variants_on_option_value_id", using: :btree
  add_index "spree_option_value_variants", ["variant_id", "option_value_id"], name: "index_option_values_variants_on_variant_id_and_option_value_id", using: :btree

  create_table "spree_option_values", force: :cascade do |t|
    t.integer  "position"
    t.string   "name"
    t.string   "presentation"
    t.integer  "option_type_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "spree_option_values", ["option_type_id"], name: "index_spree_option_values_on_option_type_id", using: :btree
  add_index "spree_option_values", ["position"], name: "index_spree_option_values_on_position", using: :btree

  create_table "spree_order_promotions", id: false, force: :cascade do |t|
    t.integer "order_id"
    t.integer "promotion_id"
  end

  add_index "spree_order_promotions", ["order_id"], name: "index_spree_order_promotions_on_order_id", using: :btree
  add_index "spree_order_promotions", ["promotion_id", "order_id"], name: "index_spree_order_promotions_on_promotion_id_and_order_id", using: :btree

  create_table "spree_orders", force: :cascade do |t|
    t.string   "number",                       limit: 32
    t.decimal  "item_total",                              precision: 10, scale: 2, default: 0.0,     null: false
    t.decimal  "total",                                   precision: 10, scale: 2, default: 0.0,     null: false
    t.string   "state"
    t.decimal  "adjustment_total",                        precision: 10, scale: 2, default: 0.0,     null: false
    t.integer  "user_id"
    t.datetime "completed_at"
    t.integer  "bill_address_id"
    t.integer  "ship_address_id"
    t.decimal  "payment_total",                           precision: 10, scale: 2, default: 0.0
    t.integer  "shipping_method_id"
    t.string   "shipment_state"
    t.string   "payment_state"
    t.string   "email"
    t.text     "special_instructions"
    t.datetime "created_at",                                                                         null: false
    t.datetime "updated_at",                                                                         null: false
    t.string   "currency"
    t.string   "last_ip_address"
    t.integer  "created_by_id"
    t.decimal  "shipment_total",                          precision: 10, scale: 2, default: 0.0,     null: false
    t.decimal  "additional_tax_total",                    precision: 10, scale: 2, default: 0.0
    t.decimal  "promo_total",                             precision: 10, scale: 2, default: 0.0
    t.string   "channel",                                                          default: "spree"
    t.decimal  "included_tax_total",                      precision: 10, scale: 2, default: 0.0,     null: false
    t.integer  "item_count",                                                       default: 0
    t.integer  "approver_id"
    t.datetime "approved_at"
    t.boolean  "confirmation_delivered",                                           default: false
    t.boolean  "considered_risky",                                                 default: false
    t.string   "guest_token"
    t.datetime "canceled_at"
    t.integer  "canceler_id"
    t.integer  "store_id"
    t.integer  "state_lock_version",                                               default: 0,       null: false
    t.decimal  "taxable_adjustment_total",                precision: 10, scale: 2, default: 0.0,     null: false
    t.decimal  "non_taxable_adjustment_total",            precision: 10, scale: 2, default: 0.0,     null: false
  end

  add_index "spree_orders", ["approver_id"], name: "index_spree_orders_on_approver_id", using: :btree
  add_index "spree_orders", ["bill_address_id"], name: "index_spree_orders_on_bill_address_id", using: :btree
  add_index "spree_orders", ["canceler_id"], name: "index_spree_orders_on_canceler_id", using: :btree
  add_index "spree_orders", ["completed_at"], name: "index_spree_orders_on_completed_at", using: :btree
  add_index "spree_orders", ["confirmation_delivered"], name: "index_spree_orders_on_confirmation_delivered", using: :btree
  add_index "spree_orders", ["considered_risky"], name: "index_spree_orders_on_considered_risky", using: :btree
  add_index "spree_orders", ["created_by_id"], name: "index_spree_orders_on_created_by_id", using: :btree
  add_index "spree_orders", ["guest_token"], name: "index_spree_orders_on_guest_token", using: :btree
  add_index "spree_orders", ["number"], name: "index_spree_orders_on_number", using: :btree
  add_index "spree_orders", ["ship_address_id"], name: "index_spree_orders_on_ship_address_id", using: :btree
  add_index "spree_orders", ["shipping_method_id"], name: "index_spree_orders_on_shipping_method_id", using: :btree
  add_index "spree_orders", ["store_id"], name: "index_spree_orders_on_store_id", using: :btree
  add_index "spree_orders", ["user_id", "created_by_id"], name: "index_spree_orders_on_user_id_and_created_by_id", using: :btree

  create_table "spree_pages", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.string   "slug"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.boolean  "show_in_header",           default: false, null: false
    t.boolean  "show_in_footer",           default: false, null: false
    t.string   "foreign_link"
    t.integer  "position",                 default: 1,     null: false
    t.boolean  "visible",                  default: true
    t.string   "meta_keywords"
    t.string   "meta_description"
    t.string   "layout"
    t.boolean  "show_in_sidebar",          default: false, null: false
    t.string   "meta_title"
    t.boolean  "render_layout_as_partial", default: false
  end

  add_index "spree_pages", ["slug"], name: "index_spree_pages_on_slug", using: :btree

  create_table "spree_pages_stores", id: false, force: :cascade do |t|
    t.integer  "store_id"
    t.integer  "page_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "spree_pages_stores", ["page_id"], name: "index_spree_pages_stores_on_page_id", using: :btree
  add_index "spree_pages_stores", ["store_id"], name: "index_spree_pages_stores_on_store_id", using: :btree

  create_table "spree_part_line_items", force: :cascade do |t|
    t.integer "line_item_id",             null: false
    t.integer "variant_id",               null: false
    t.integer "quantity",     default: 1
  end

  create_table "spree_payment_capture_events", force: :cascade do |t|
    t.decimal  "amount",     precision: 10, scale: 2, default: 0.0
    t.integer  "payment_id"
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
  end

  add_index "spree_payment_capture_events", ["payment_id"], name: "index_spree_payment_capture_events_on_payment_id", using: :btree

  create_table "spree_payment_methods", force: :cascade do |t|
    t.string   "type"
    t.string   "name"
    t.text     "description"
    t.boolean  "active",       default: true
    t.datetime "deleted_at"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "display_on",   default: "both"
    t.boolean  "auto_capture"
    t.text     "preferences"
    t.integer  "position",     default: 0
  end

  add_index "spree_payment_methods", ["id", "type"], name: "index_spree_payment_methods_on_id_and_type", using: :btree

  create_table "spree_payments", force: :cascade do |t|
    t.decimal  "amount",               precision: 10, scale: 2, default: 0.0, null: false
    t.integer  "order_id"
    t.integer  "source_id"
    t.string   "source_type"
    t.integer  "payment_method_id"
    t.string   "state"
    t.string   "response_code"
    t.string   "avs_response"
    t.datetime "created_at",                                                  null: false
    t.datetime "updated_at",                                                  null: false
    t.string   "number"
    t.string   "cvv_response_code"
    t.string   "cvv_response_message"
  end

  add_index "spree_payments", ["order_id"], name: "index_spree_payments_on_order_id", using: :btree
  add_index "spree_payments", ["payment_method_id"], name: "index_spree_payments_on_payment_method_id", using: :btree
  add_index "spree_payments", ["source_id", "source_type"], name: "index_spree_payments_on_source_id_and_source_type", using: :btree

  create_table "spree_post_category", force: :cascade do |t|
    t.string   "name"
    t.string   "slug"
    t.string   "tag_title"
    t.string   "meta_description"
    t.string   "meta_keywords"
    t.text     "description"
    t.string   "icon_file_name"
    t.string   "icon_content_type"
    t.integer  "icon_file_size"
    t.datetime "icon_update_at"
    t.integer  "icon_width"
    t.integer  "icon_height"
    t.integer  "position"
    t.boolean  "active",            default: false
    t.datetime "published_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "spree_post_category", ["slug"], name: "index_spree_post_category_on_slug", unique: true, using: :btree

  create_table "spree_preferences", force: :cascade do |t|
    t.text     "value"
    t.string   "key"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "spree_preferences", ["key"], name: "index_spree_preferences_on_key", unique: true, using: :btree

  create_table "spree_prices", force: :cascade do |t|
    t.integer  "variant_id",                          null: false
    t.decimal  "amount",     precision: 10, scale: 2
    t.string   "currency"
    t.datetime "deleted_at"
  end

  add_index "spree_prices", ["deleted_at"], name: "index_spree_prices_on_deleted_at", using: :btree
  add_index "spree_prices", ["variant_id", "currency"], name: "index_spree_prices_on_variant_id_and_currency", using: :btree

  create_table "spree_product_customization_types", force: :cascade do |t|
    t.string   "name"
    t.string   "presentation"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "spree_product_customization_types_products", id: false, force: :cascade do |t|
    t.integer "product_customization_type_id"
    t.integer "product_id"
  end

  create_table "spree_product_customizations", force: :cascade do |t|
    t.integer  "line_item_id"
    t.integer  "product_customization_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "spree_product_option_types", force: :cascade do |t|
    t.integer  "position"
    t.integer  "product_id"
    t.integer  "option_type_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "spree_product_option_types", ["option_type_id"], name: "index_spree_product_option_types_on_option_type_id", using: :btree
  add_index "spree_product_option_types", ["position"], name: "index_spree_product_option_types_on_position", using: :btree
  add_index "spree_product_option_types", ["product_id"], name: "index_spree_product_option_types_on_product_id", using: :btree

  create_table "spree_product_personalizations", force: :cascade do |t|
    t.integer  "product_id"
    t.string   "name"
    t.boolean  "required",   default: false
    t.integer  "limit",      default: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "spree_product_personalizations", ["product_id"], name: "index_spree_product_personalizations_on_product_id", using: :btree

  create_table "spree_product_promotion_rules", id: false, force: :cascade do |t|
    t.integer "product_id"
    t.integer "promotion_rule_id"
  end

  add_index "spree_product_promotion_rules", ["product_id"], name: "index_products_promotion_rules_on_product_id", using: :btree
  add_index "spree_product_promotion_rules", ["promotion_rule_id", "product_id"], name: "index_products_promotion_rules_on_promotion_rule_and_product", using: :btree

  create_table "spree_product_properties", force: :cascade do |t|
    t.string   "value"
    t.integer  "product_id"
    t.integer  "property_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "position",    default: 0
  end

  add_index "spree_product_properties", ["position"], name: "index_spree_product_properties_on_position", using: :btree
  add_index "spree_product_properties", ["product_id"], name: "index_product_properties_on_product_id", using: :btree
  add_index "spree_product_properties", ["property_id"], name: "index_spree_product_properties_on_property_id", using: :btree

  create_table "spree_products", force: :cascade do |t|
    t.string   "name",                                         default: "",    null: false
    t.text     "description"
    t.datetime "available_on"
    t.datetime "deleted_at"
    t.string   "slug"
    t.text     "meta_description"
    t.string   "meta_keywords"
    t.integer  "tax_category_id"
    t.integer  "shipping_category_id"
    t.datetime "created_at",                                                   null: false
    t.datetime "updated_at",                                                   null: false
    t.boolean  "promotionable",                                default: true
    t.string   "meta_title"
    t.datetime "discontinue_on"
    t.decimal  "avg_rating",           precision: 7, scale: 5, default: 0.0,   null: false
    t.integer  "reviews_count",                                default: 0,     null: false
    t.boolean  "can_be_part",                                  default: false, null: false
    t.boolean  "individual_sale",                              default: true,  null: false
  end

  add_index "spree_products", ["available_on"], name: "index_spree_products_on_available_on", using: :btree
  add_index "spree_products", ["deleted_at"], name: "index_spree_products_on_deleted_at", using: :btree
  add_index "spree_products", ["discontinue_on"], name: "index_spree_products_on_discontinue_on", using: :btree
  add_index "spree_products", ["name"], name: "index_spree_products_on_name", using: :btree
  add_index "spree_products", ["shipping_category_id"], name: "index_spree_products_on_shipping_category_id", using: :btree
  add_index "spree_products", ["slug"], name: "index_spree_products_on_slug", unique: true, using: :btree
  add_index "spree_products", ["tax_category_id"], name: "index_spree_products_on_tax_category_id", using: :btree

  create_table "spree_products_taxons", force: :cascade do |t|
    t.integer "product_id"
    t.integer "taxon_id"
    t.integer "position"
  end

  add_index "spree_products_taxons", ["position"], name: "index_spree_products_taxons_on_position", using: :btree
  add_index "spree_products_taxons", ["product_id"], name: "index_spree_products_taxons_on_product_id", using: :btree
  add_index "spree_products_taxons", ["taxon_id"], name: "index_spree_products_taxons_on_taxon_id", using: :btree

  create_table "spree_promotion_action_line_items", force: :cascade do |t|
    t.integer "promotion_action_id"
    t.integer "variant_id"
    t.integer "quantity",            default: 1
  end

  add_index "spree_promotion_action_line_items", ["promotion_action_id"], name: "index_spree_promotion_action_line_items_on_promotion_action_id", using: :btree
  add_index "spree_promotion_action_line_items", ["variant_id"], name: "index_spree_promotion_action_line_items_on_variant_id", using: :btree

  create_table "spree_promotion_actions", force: :cascade do |t|
    t.integer  "promotion_id"
    t.integer  "position"
    t.string   "type"
    t.datetime "deleted_at"
  end

  add_index "spree_promotion_actions", ["deleted_at"], name: "index_spree_promotion_actions_on_deleted_at", using: :btree
  add_index "spree_promotion_actions", ["id", "type"], name: "index_spree_promotion_actions_on_id_and_type", using: :btree
  add_index "spree_promotion_actions", ["promotion_id"], name: "index_spree_promotion_actions_on_promotion_id", using: :btree

  create_table "spree_promotion_categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "code"
  end

  create_table "spree_promotion_rule_taxons", force: :cascade do |t|
    t.integer "taxon_id"
    t.integer "promotion_rule_id"
  end

  add_index "spree_promotion_rule_taxons", ["promotion_rule_id"], name: "index_spree_promotion_rule_taxons_on_promotion_rule_id", using: :btree
  add_index "spree_promotion_rule_taxons", ["taxon_id"], name: "index_spree_promotion_rule_taxons_on_taxon_id", using: :btree

  create_table "spree_promotion_rule_users", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "promotion_rule_id"
  end

  add_index "spree_promotion_rule_users", ["promotion_rule_id"], name: "index_promotion_rules_users_on_promotion_rule_id", using: :btree
  add_index "spree_promotion_rule_users", ["user_id", "promotion_rule_id"], name: "index_promotion_rules_users_on_user_id_and_promotion_rule_id", using: :btree

  create_table "spree_promotion_rules", force: :cascade do |t|
    t.integer  "promotion_id"
    t.integer  "user_id"
    t.integer  "product_group_id"
    t.string   "type"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "code"
    t.text     "preferences"
  end

  add_index "spree_promotion_rules", ["product_group_id"], name: "index_promotion_rules_on_product_group_id", using: :btree
  add_index "spree_promotion_rules", ["promotion_id"], name: "index_spree_promotion_rules_on_promotion_id", using: :btree
  add_index "spree_promotion_rules", ["user_id"], name: "index_promotion_rules_on_user_id", using: :btree

  create_table "spree_promotions", force: :cascade do |t|
    t.string   "description"
    t.datetime "expires_at"
    t.datetime "starts_at"
    t.string   "name"
    t.string   "type"
    t.integer  "usage_limit"
    t.string   "match_policy",          default: "all"
    t.string   "code"
    t.boolean  "advertise",             default: false
    t.string   "path"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.integer  "promotion_category_id"
  end

  add_index "spree_promotions", ["advertise"], name: "index_spree_promotions_on_advertise", using: :btree
  add_index "spree_promotions", ["code"], name: "index_spree_promotions_on_code", using: :btree
  add_index "spree_promotions", ["expires_at"], name: "index_spree_promotions_on_expires_at", using: :btree
  add_index "spree_promotions", ["id", "type"], name: "index_spree_promotions_on_id_and_type", using: :btree
  add_index "spree_promotions", ["promotion_category_id"], name: "index_spree_promotions_on_promotion_category_id", using: :btree
  add_index "spree_promotions", ["starts_at"], name: "index_spree_promotions_on_starts_at", using: :btree

  create_table "spree_properties", force: :cascade do |t|
    t.string   "name"
    t.string   "presentation", null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "spree_property_prototypes", id: false, force: :cascade do |t|
    t.integer "prototype_id"
    t.integer "property_id"
  end

  add_index "spree_property_prototypes", ["prototype_id", "property_id"], name: "index_properties_prototypes_on_prototype_and_property", using: :btree

  create_table "spree_prototype_taxons", force: :cascade do |t|
    t.integer "taxon_id"
    t.integer "prototype_id"
  end

  add_index "spree_prototype_taxons", ["prototype_id", "taxon_id"], name: "index_spree_prototype_taxons_on_prototype_id_and_taxon_id", using: :btree
  add_index "spree_prototype_taxons", ["taxon_id"], name: "index_spree_prototype_taxons_on_taxon_id", using: :btree

  create_table "spree_prototypes", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "spree_refund_reasons", force: :cascade do |t|
    t.string   "name"
    t.boolean  "active",     default: true
    t.boolean  "mutable",    default: true
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "spree_refunds", force: :cascade do |t|
    t.integer  "payment_id"
    t.decimal  "amount",           precision: 10, scale: 2, default: 0.0, null: false
    t.string   "transaction_id"
    t.datetime "created_at",                                              null: false
    t.datetime "updated_at",                                              null: false
    t.integer  "refund_reason_id"
    t.integer  "reimbursement_id"
  end

  add_index "spree_refunds", ["refund_reason_id"], name: "index_refunds_on_refund_reason_id", using: :btree

  create_table "spree_reimbursement_credits", force: :cascade do |t|
    t.decimal "amount",           precision: 10, scale: 2, default: 0.0, null: false
    t.integer "reimbursement_id"
    t.integer "creditable_id"
    t.string  "creditable_type"
  end

  create_table "spree_reimbursement_types", force: :cascade do |t|
    t.string   "name"
    t.boolean  "active",     default: true
    t.boolean  "mutable",    default: true
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "type"
  end

  add_index "spree_reimbursement_types", ["type"], name: "index_spree_reimbursement_types_on_type", using: :btree

  create_table "spree_reimbursements", force: :cascade do |t|
    t.string   "number"
    t.string   "reimbursement_status"
    t.integer  "customer_return_id"
    t.integer  "order_id"
    t.decimal  "total",                precision: 10, scale: 2
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
  end

  add_index "spree_reimbursements", ["customer_return_id"], name: "index_spree_reimbursements_on_customer_return_id", using: :btree
  add_index "spree_reimbursements", ["order_id"], name: "index_spree_reimbursements_on_order_id", using: :btree

  create_table "spree_return_authorization_reasons", force: :cascade do |t|
    t.string   "name"
    t.boolean  "active",     default: true
    t.boolean  "mutable",    default: true
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "spree_return_authorizations", force: :cascade do |t|
    t.string   "number"
    t.string   "state"
    t.integer  "order_id"
    t.text     "memo"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "stock_location_id"
    t.integer  "return_authorization_reason_id"
  end

  add_index "spree_return_authorizations", ["return_authorization_reason_id"], name: "index_return_authorizations_on_return_authorization_reason_id", using: :btree

  create_table "spree_return_items", force: :cascade do |t|
    t.integer  "return_authorization_id"
    t.integer  "inventory_unit_id"
    t.integer  "exchange_variant_id"
    t.datetime "created_at",                                                              null: false
    t.datetime "updated_at",                                                              null: false
    t.decimal  "pre_tax_amount",                  precision: 12, scale: 4, default: 0.0,  null: false
    t.decimal  "included_tax_total",              precision: 12, scale: 4, default: 0.0,  null: false
    t.decimal  "additional_tax_total",            precision: 12, scale: 4, default: 0.0,  null: false
    t.string   "reception_status"
    t.string   "acceptance_status"
    t.integer  "customer_return_id"
    t.integer  "reimbursement_id"
    t.integer  "exchange_inventory_unit_id"
    t.text     "acceptance_status_errors"
    t.integer  "preferred_reimbursement_type_id"
    t.integer  "override_reimbursement_type_id"
    t.boolean  "resellable",                                               default: true, null: false
  end

  add_index "spree_return_items", ["customer_return_id"], name: "index_return_items_on_customer_return_id", using: :btree
  add_index "spree_return_items", ["exchange_inventory_unit_id"], name: "index_spree_return_items_on_exchange_inventory_unit_id", using: :btree

  create_table "spree_reviews", force: :cascade do |t|
    t.integer  "product_id"
    t.string   "name"
    t.string   "location"
    t.integer  "rating"
    t.text     "title"
    t.text     "review"
    t.boolean  "approved",        default: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.integer  "user_id"
    t.string   "ip_address"
    t.string   "locale",          default: "en"
    t.boolean  "show_identifier", default: true
  end

  add_index "spree_reviews", ["show_identifier"], name: "index_spree_reviews_on_show_identifier", using: :btree

  create_table "spree_role_users", id: false, force: :cascade do |t|
    t.integer "role_id"
    t.integer "user_id"
  end

  add_index "spree_role_users", ["role_id"], name: "index_spree_role_users_on_role_id", using: :btree
  add_index "spree_role_users", ["user_id"], name: "index_spree_role_users_on_user_id", using: :btree

  create_table "spree_roles", force: :cascade do |t|
    t.string "name"
  end

  create_table "spree_shipments", force: :cascade do |t|
    t.string   "tracking"
    t.string   "number"
    t.decimal  "cost",                         precision: 10, scale: 2, default: 0.0
    t.datetime "shipped_at"
    t.integer  "order_id"
    t.integer  "address_id"
    t.string   "state"
    t.datetime "created_at",                                                          null: false
    t.datetime "updated_at",                                                          null: false
    t.integer  "stock_location_id"
    t.decimal  "adjustment_total",             precision: 10, scale: 2, default: 0.0
    t.decimal  "additional_tax_total",         precision: 10, scale: 2, default: 0.0
    t.decimal  "promo_total",                  precision: 10, scale: 2, default: 0.0
    t.decimal  "included_tax_total",           precision: 10, scale: 2, default: 0.0, null: false
    t.decimal  "pre_tax_amount",               precision: 12, scale: 4, default: 0.0, null: false
    t.decimal  "taxable_adjustment_total",     precision: 10, scale: 2, default: 0.0, null: false
    t.decimal  "non_taxable_adjustment_total", precision: 10, scale: 2, default: 0.0, null: false
  end

  add_index "spree_shipments", ["address_id"], name: "index_spree_shipments_on_address_id", using: :btree
  add_index "spree_shipments", ["number"], name: "index_shipments_on_number", using: :btree
  add_index "spree_shipments", ["order_id"], name: "index_spree_shipments_on_order_id", using: :btree
  add_index "spree_shipments", ["stock_location_id"], name: "index_spree_shipments_on_stock_location_id", using: :btree

  create_table "spree_shipping_categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "spree_shipping_method_categories", force: :cascade do |t|
    t.integer  "shipping_method_id",   null: false
    t.integer  "shipping_category_id", null: false
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "spree_shipping_method_categories", ["shipping_category_id", "shipping_method_id"], name: "unique_spree_shipping_method_categories", unique: true, using: :btree
  add_index "spree_shipping_method_categories", ["shipping_method_id"], name: "index_spree_shipping_method_categories_on_shipping_method_id", using: :btree

  create_table "spree_shipping_method_zones", id: false, force: :cascade do |t|
    t.integer "shipping_method_id"
    t.integer "zone_id"
  end

  create_table "spree_shipping_methods", force: :cascade do |t|
    t.string   "name"
    t.string   "display_on"
    t.datetime "deleted_at"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "tracking_url"
    t.string   "admin_name"
    t.integer  "tax_category_id"
    t.string   "code"
  end

  add_index "spree_shipping_methods", ["deleted_at"], name: "index_spree_shipping_methods_on_deleted_at", using: :btree
  add_index "spree_shipping_methods", ["tax_category_id"], name: "index_spree_shipping_methods_on_tax_category_id", using: :btree

  create_table "spree_shipping_rates", force: :cascade do |t|
    t.integer  "shipment_id"
    t.integer  "shipping_method_id"
    t.boolean  "selected",                                   default: false
    t.decimal  "cost",               precision: 8, scale: 2, default: 0.0
    t.datetime "created_at",                                                 null: false
    t.datetime "updated_at",                                                 null: false
    t.integer  "tax_rate_id"
  end

  add_index "spree_shipping_rates", ["selected"], name: "index_spree_shipping_rates_on_selected", using: :btree
  add_index "spree_shipping_rates", ["shipment_id", "shipping_method_id"], name: "spree_shipping_rates_join_index", unique: true, using: :btree
  add_index "spree_shipping_rates", ["tax_rate_id"], name: "index_spree_shipping_rates_on_tax_rate_id", using: :btree

  create_table "spree_skrill_transactions", force: :cascade do |t|
    t.string   "email"
    t.float    "amount"
    t.string   "currency"
    t.integer  "transaction_id"
    t.integer  "customer_id"
    t.string   "payment_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "spree_state_changes", force: :cascade do |t|
    t.string   "name"
    t.string   "previous_state"
    t.integer  "stateful_id"
    t.integer  "user_id"
    t.string   "stateful_type"
    t.string   "next_state"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "spree_state_changes", ["stateful_id", "stateful_type"], name: "index_spree_state_changes_on_stateful_id_and_stateful_type", using: :btree

  create_table "spree_states", force: :cascade do |t|
    t.string   "name"
    t.string   "abbr"
    t.integer  "country_id"
    t.datetime "updated_at"
  end

  add_index "spree_states", ["country_id"], name: "index_spree_states_on_country_id", using: :btree

  create_table "spree_stock_items", force: :cascade do |t|
    t.integer  "stock_location_id"
    t.integer  "variant_id"
    t.integer  "count_on_hand",     default: 0,     null: false
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.boolean  "backorderable",     default: false
    t.datetime "deleted_at"
  end

  add_index "spree_stock_items", ["backorderable"], name: "index_spree_stock_items_on_backorderable", using: :btree
  add_index "spree_stock_items", ["deleted_at"], name: "index_spree_stock_items_on_deleted_at", using: :btree
  add_index "spree_stock_items", ["stock_location_id", "variant_id"], name: "stock_item_by_loc_and_var_id", using: :btree
  add_index "spree_stock_items", ["variant_id"], name: "index_spree_stock_items_on_variant_id", using: :btree

  create_table "spree_stock_locations", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "default",                default: false, null: false
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.integer  "state_id"
    t.string   "state_name"
    t.integer  "country_id"
    t.string   "zipcode"
    t.string   "phone"
    t.boolean  "active",                 default: true
    t.boolean  "backorderable_default",  default: false
    t.boolean  "propagate_all_variants", default: true
    t.string   "admin_name"
  end

  add_index "spree_stock_locations", ["active"], name: "index_spree_stock_locations_on_active", using: :btree
  add_index "spree_stock_locations", ["backorderable_default"], name: "index_spree_stock_locations_on_backorderable_default", using: :btree
  add_index "spree_stock_locations", ["country_id"], name: "index_spree_stock_locations_on_country_id", using: :btree
  add_index "spree_stock_locations", ["propagate_all_variants"], name: "index_spree_stock_locations_on_propagate_all_variants", using: :btree
  add_index "spree_stock_locations", ["state_id"], name: "index_spree_stock_locations_on_state_id", using: :btree

  create_table "spree_stock_movements", force: :cascade do |t|
    t.integer  "stock_item_id"
    t.integer  "quantity",        default: 0
    t.string   "action"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "originator_id"
    t.string   "originator_type"
  end

  add_index "spree_stock_movements", ["stock_item_id"], name: "index_spree_stock_movements_on_stock_item_id", using: :btree

  create_table "spree_stock_transfers", force: :cascade do |t|
    t.string   "type"
    t.string   "reference"
    t.integer  "source_location_id"
    t.integer  "destination_location_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "number"
  end

  add_index "spree_stock_transfers", ["destination_location_id"], name: "index_spree_stock_transfers_on_destination_location_id", using: :btree
  add_index "spree_stock_transfers", ["number"], name: "index_spree_stock_transfers_on_number", using: :btree
  add_index "spree_stock_transfers", ["source_location_id"], name: "index_spree_stock_transfers_on_source_location_id", using: :btree

  create_table "spree_stores", force: :cascade do |t|
    t.string   "name"
    t.string   "url"
    t.text     "meta_description"
    t.text     "meta_keywords"
    t.string   "seo_title"
    t.string   "mail_from_address"
    t.string   "default_currency"
    t.string   "code"
    t.boolean  "default",           default: false, null: false
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  add_index "spree_stores", ["code"], name: "index_spree_stores_on_code", using: :btree
  add_index "spree_stores", ["default"], name: "index_spree_stores_on_default", using: :btree
  add_index "spree_stores", ["url"], name: "index_spree_stores_on_url", using: :btree

  create_table "spree_tax_categories", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.boolean  "is_default",  default: false
    t.datetime "deleted_at"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "tax_code"
  end

  add_index "spree_tax_categories", ["deleted_at"], name: "index_spree_tax_categories_on_deleted_at", using: :btree
  add_index "spree_tax_categories", ["is_default"], name: "index_spree_tax_categories_on_is_default", using: :btree

  create_table "spree_tax_rates", force: :cascade do |t|
    t.decimal  "amount",             precision: 8, scale: 5
    t.integer  "zone_id"
    t.integer  "tax_category_id"
    t.boolean  "included_in_price",                          default: false
    t.datetime "created_at",                                                 null: false
    t.datetime "updated_at",                                                 null: false
    t.string   "name"
    t.boolean  "show_rate_in_label",                         default: true
    t.datetime "deleted_at"
  end

  add_index "spree_tax_rates", ["deleted_at"], name: "index_spree_tax_rates_on_deleted_at", using: :btree
  add_index "spree_tax_rates", ["included_in_price"], name: "index_spree_tax_rates_on_included_in_price", using: :btree
  add_index "spree_tax_rates", ["show_rate_in_label"], name: "index_spree_tax_rates_on_show_rate_in_label", using: :btree
  add_index "spree_tax_rates", ["tax_category_id"], name: "index_spree_tax_rates_on_tax_category_id", using: :btree
  add_index "spree_tax_rates", ["zone_id"], name: "index_spree_tax_rates_on_zone_id", using: :btree

  create_table "spree_taxonomies", force: :cascade do |t|
    t.string   "name",                   null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "position",   default: 0
  end

  add_index "spree_taxonomies", ["position"], name: "index_spree_taxonomies_on_position", using: :btree

  create_table "spree_taxons", force: :cascade do |t|
    t.integer  "parent_id"
    t.integer  "position",          default: 0
    t.string   "name",                          null: false
    t.string   "permalink"
    t.integer  "taxonomy_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.string   "icon_file_name"
    t.string   "icon_content_type"
    t.integer  "icon_file_size"
    t.datetime "icon_updated_at"
    t.text     "description"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "meta_title"
    t.string   "meta_description"
    t.string   "meta_keywords"
    t.integer  "depth"
  end

  add_index "spree_taxons", ["parent_id"], name: "index_taxons_on_parent_id", using: :btree
  add_index "spree_taxons", ["permalink"], name: "index_taxons_on_permalink", using: :btree
  add_index "spree_taxons", ["position"], name: "index_spree_taxons_on_position", using: :btree
  add_index "spree_taxons", ["taxonomy_id"], name: "index_taxons_on_taxonomy_id", using: :btree

  create_table "spree_trackers", force: :cascade do |t|
    t.string   "analytics_id"
    t.boolean  "active",       default: true
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "spree_trackers", ["active"], name: "index_spree_trackers_on_active", using: :btree

  create_table "spree_uploads", force: :cascade do |t|
    t.string   "attachment_name"
    t.string   "attachment_alt"
    t.string   "attachment_content_type"
    t.string   "attachment_file_name"
    t.integer  "attachment_size"
    t.integer  "attachment_width"
    t.integer  "attachment_height"
    t.integer  "position"
    t.integer  "uploadable_id"
    t.string   "uploadable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "spree_users", force: :cascade do |t|
    t.string   "encrypted_password",     limit: 128
    t.string   "password_salt",          limit: 128
    t.string   "email"
    t.string   "remember_token"
    t.string   "persistence_token"
    t.string   "reset_password_token"
    t.string   "perishable_token"
    t.integer  "sign_in_count",                      default: 0, null: false
    t.integer  "failed_attempts",                    default: 0, null: false
    t.datetime "last_request_at"
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "login"
    t.integer  "ship_address_id"
    t.integer  "bill_address_id"
    t.string   "authentication_token"
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "reset_password_sent_at"
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.string   "spree_api_key",          limit: 48
    t.datetime "remember_created_at"
    t.datetime "deleted_at"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
  end

  add_index "spree_users", ["bill_address_id"], name: "index_spree_users_on_bill_address_id", using: :btree
  add_index "spree_users", ["deleted_at"], name: "index_spree_users_on_deleted_at", using: :btree
  add_index "spree_users", ["email"], name: "email_idx_unique", unique: true, using: :btree
  add_index "spree_users", ["ship_address_id"], name: "index_spree_users_on_ship_address_id", using: :btree
  add_index "spree_users", ["spree_api_key"], name: "index_spree_users_on_spree_api_key", using: :btree

  create_table "spree_variants", force: :cascade do |t|
    t.string   "sku",                                        default: "",    null: false
    t.decimal  "weight",            precision: 8,  scale: 2, default: 0.0
    t.decimal  "height",            precision: 8,  scale: 2
    t.decimal  "width",             precision: 8,  scale: 2
    t.decimal  "depth",             precision: 8,  scale: 2
    t.datetime "deleted_at"
    t.boolean  "is_master",                                  default: false
    t.integer  "product_id"
    t.decimal  "cost_price",        precision: 10, scale: 2
    t.integer  "position"
    t.string   "cost_currency"
    t.boolean  "track_inventory",                            default: true
    t.integer  "tax_category_id"
    t.datetime "updated_at"
    t.integer  "stock_items_count",                          default: 0,     null: false
    t.datetime "discontinue_on"
  end

  add_index "spree_variants", ["deleted_at"], name: "index_spree_variants_on_deleted_at", using: :btree
  add_index "spree_variants", ["discontinue_on"], name: "index_spree_variants_on_discontinue_on", using: :btree
  add_index "spree_variants", ["is_master"], name: "index_spree_variants_on_is_master", using: :btree
  add_index "spree_variants", ["position"], name: "index_spree_variants_on_position", using: :btree
  add_index "spree_variants", ["product_id"], name: "index_spree_variants_on_product_id", using: :btree
  add_index "spree_variants", ["sku"], name: "index_spree_variants_on_sku", using: :btree
  add_index "spree_variants", ["tax_category_id"], name: "index_spree_variants_on_tax_category_id", using: :btree
  add_index "spree_variants", ["track_inventory"], name: "index_spree_variants_on_track_inventory", using: :btree

  create_table "spree_zone_members", force: :cascade do |t|
    t.integer  "zoneable_id"
    t.string   "zoneable_type"
    t.integer  "zone_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "spree_zone_members", ["zone_id"], name: "index_spree_zone_members_on_zone_id", using: :btree
  add_index "spree_zone_members", ["zoneable_id", "zoneable_type"], name: "index_spree_zone_members_on_zoneable_id_and_zoneable_type", using: :btree

  create_table "spree_zones", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.boolean  "default_tax",        default: false
    t.integer  "zone_members_count", default: 0
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.string   "kind"
  end

  add_index "spree_zones", ["default_tax"], name: "index_spree_zones_on_default_tax", using: :btree
  add_index "spree_zones", ["kind"], name: "index_spree_zones_on_kind", using: :btree

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true, using: :btree

  create_table "tags", force: :cascade do |t|
    t.string  "name"
    t.integer "taggings_count", default: 0
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true, using: :btree

end
