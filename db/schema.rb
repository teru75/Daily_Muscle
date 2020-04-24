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

ActiveRecord::Schema.define(version: 2020_04_24_071521) do

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "customers", force: :cascade do |t|
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.boolean "is_deleted", default: false, null: false
    t.boolean "is_data_available", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "profile_image_id"
    t.string "email", default: "", null: false
    t.index ["reset_password_token"], name: "index_customers_on_reset_password_token", unique: true
  end

  create_table "event_likes", force: :cascade do |t|
    t.integer "customer_id"
    t.integer "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "event_templates", force: :cascade do |t|
    t.integer "part"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "theme"
    t.boolean "is_enabled", default: true, null: false
    t.text "introduction"
  end

  create_table "events", force: :cascade do |t|
    t.integer "customer_id"
    t.datetime "start"
    t.datetime "end"
    t.integer "part"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "menu_templates", force: :cascade do |t|
    t.integer "event_template_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "menus", force: :cascade do |t|
    t.integer "event_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "my_gyms", force: :cascade do |t|
    t.integer "customer_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "my_menu_items", force: :cascade do |t|
    t.integer "my_menu_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "my_menu_likes", force: :cascade do |t|
    t.integer "customer_id"
    t.integer "my_menu_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "my_menus", force: :cascade do |t|
    t.integer "customer_id"
    t.string "theme"
    t.integer "part"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "my_supplements", force: :cascade do |t|
    t.integer "customer_id"
    t.string "name"
    t.integer "genre"
    t.string "brand"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "relationships", force: :cascade do |t|
    t.integer "follower_id"
    t.integer "followed_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reps", force: :cascade do |t|
    t.integer "menu_id"
    t.float "weight"
    t.integer "count"
    t.integer "set_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
