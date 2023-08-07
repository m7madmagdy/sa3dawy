# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_08_07_140205) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.decimal "price"
    t.string "url"
    t.string "image_url"
    t.text "description"
    t.bigint "source_page_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["source_page_id"], name: "index_products_on_source_page_id"
  end

  create_table "source_configs", force: :cascade do |t|
    t.string "name_selector"
    t.string "price_selector"
    t.string "description_selector"
    t.string "products_url_selector"
    t.string "image_url_selector"
    t.bigint "source_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["source_id"], name: "index_source_configs_on_source_id"
  end

  create_table "source_pages", force: :cascade do |t|
    t.string "name"
    t.string "url"
    t.bigint "source_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["source_id"], name: "index_source_pages_on_source_id"
  end

  create_table "sources", force: :cascade do |t|
    t.string "name"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "products", "source_pages"
  add_foreign_key "source_configs", "sources"
  add_foreign_key "source_pages", "sources"
end
