# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_09_15_145313) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "purchase_options", force: :cascade do |t|
    t.bigint "visual_content_id", null: false
    t.decimal "price", precision: 8, scale: 2, null: false
    t.integer "video_quality", default: 1, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["visual_content_id", "price", "video_quality"], name: "visual_content_price_video_quality_index", unique: true
    t.index ["visual_content_id"], name: "index_purchase_options_on_visual_content_id"
  end

  create_table "purchases", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "purchase_option_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["purchase_option_id"], name: "index_purchases_on_purchase_option_id"
    t.index ["user_id"], name: "index_purchases_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  create_table "visual_contents", force: :cascade do |t|
    t.string "title", null: false
    t.text "plot", null: false
    t.string "type", default: "Movie", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["title"], name: "index_visual_contents_on_title", unique: true
    t.index ["type"], name: "index_visual_contents_on_type"
  end

  add_foreign_key "purchase_options", "visual_contents"
  add_foreign_key "purchases", "purchase_options"
  add_foreign_key "purchases", "users"
end
