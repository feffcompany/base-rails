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

ActiveRecord::Schema.define(version: 2021_06_04_175132) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "arcades", force: :cascade do |t|
    t.string "name"
    t.text "address"
    t.integer "comments_count"
    t.bigint "owner_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["owner_id"], name: "index_arcades_on_owner_id"
  end

  create_table "comments", force: :cascade do |t|
    t.bigint "author_id", null: false
    t.bigint "arcade_id", null: false
    t.text "body"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["arcade_id"], name: "index_comments_on_arcade_id"
    t.index ["author_id"], name: "index_comments_on_author_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.bigint "fan_id", null: false
    t.bigint "game_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["fan_id"], name: "index_favorites_on_fan_id"
    t.index ["game_id"], name: "index_favorites_on_game_id"
  end

  create_table "games", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "release_date"
    t.integer "favorites_count"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "machines", force: :cascade do |t|
    t.bigint "arcade_id", null: false
    t.bigint "game_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "number_of_machines"
    t.index ["arcade_id"], name: "index_machines_on_arcade_id"
    t.index ["game_id"], name: "index_machines_on_game_id"
  end

  create_table "movies", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "username"
    t.boolean "private"
    t.integer "favorites_count"
    t.integer "comments_count"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "arcades", "users", column: "owner_id"
  add_foreign_key "comments", "arcades"
  add_foreign_key "comments", "users", column: "author_id"
  add_foreign_key "favorites", "games"
  add_foreign_key "favorites", "users", column: "fan_id"
  add_foreign_key "machines", "arcades"
  add_foreign_key "machines", "games"
end
