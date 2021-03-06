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

ActiveRecord::Schema.define(version: 2019_06_26_072537) do

  create_table "colleges", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name", default: "", null: false
    t.string "college_image"
    t.index ["email"], name: "index_colleges_on_email", unique: true
    t.index ["reset_password_token"], name: "index_colleges_on_reset_password_token", unique: true
  end

  create_table "comments", force: :cascade do |t|
    t.string "content"
    t.integer "college_id"
    t.integer "company_id"
    t.integer "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["college_id", "company_id", "product_id"], name: "index_comments_on_college_id_and_company_id_and_product_id"
    t.index ["college_id"], name: "index_comments_on_college_id"
    t.index ["company_id"], name: "index_comments_on_company_id"
    t.index ["product_id"], name: "index_comments_on_product_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.text "description"
    t.string "company_image"
    t.index ["email"], name: "index_companies_on_email", unique: true
    t.index ["reset_password_token"], name: "index_companies_on_reset_password_token", unique: true
  end

  create_table "likes", force: :cascade do |t|
    t.integer "product_id", null: false
    t.integer "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "college_id"
    t.index ["product_id"], name: "index_likes_on_product_id"
  end

  create_table "matchings", force: :cascade do |t|
    t.integer "product_id"
    t.integer "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_matchings_on_company_id"
    t.index ["product_id", "company_id"], name: "index_matchings_on_product_id_and_company_id", unique: true
    t.index ["product_id"], name: "index_matchings_on_product_id"
  end

  create_table "pictures", force: :cascade do |t|
    t.string "image"
    t.integer "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "product_id"
    t.index ["product_id"], name: "index_pictures_on_product_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.string "content"
    t.integer "college_id"
    t.integer "picture_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["college_id"], name: "index_posts_on_college_id"
    t.index ["picture_id"], name: "index_posts_on_picture_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "college_id"
    t.integer "likes_count", default: 0, null: false
    t.index ["college_id"], name: "index_products_on_college_id"
  end

  create_table "relationships", force: :cascade do |t|
    t.integer "college_id"
    t.integer "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["college_id", "company_id"], name: "index_relationships_on_college_id_and_company_id", unique: true
    t.index ["college_id"], name: "index_relationships_on_college_id"
    t.index ["company_id"], name: "index_relationships_on_company_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.text "content"
    t.integer "college_id"
    t.integer "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
