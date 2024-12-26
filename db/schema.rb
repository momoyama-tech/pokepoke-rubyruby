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

ActiveRecord::Schema[8.0].define(version: 2024_12_26_153244) do
  create_table "deck_recipes", force: :cascade do |t|
    t.integer "user_id"
    t.string "name", null: false
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_deck_recipes_on_user_id"
  end

  create_table "deck_recipes_poke_cards", force: :cascade do |t|
    t.integer "deck_recipe_id"
    t.integer "poke_card_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deck_recipe_id"], name: "index_deck_recipes_poke_cards_on_deck_recipe_id"
    t.index ["poke_card_id"], name: "index_deck_recipes_poke_cards_on_poke_card_id"
  end

  create_table "decks", force: :cascade do |t|
    t.integer "user_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_decks_on_user_id"
  end

  create_table "decks_poke_cards", force: :cascade do |t|
    t.integer "deck_id"
    t.integer "poke_card_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deck_id"], name: "index_decks_poke_cards_on_deck_id"
    t.index ["poke_card_id"], name: "index_decks_poke_cards_on_poke_card_id"
  end

  create_table "match_results", force: :cascade do |t|
    t.integer "user_id"
    t.integer "target_user_id"
    t.integer "result", limit: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["target_user_id"], name: "index_match_results_on_target_user_id"
    t.index ["user_id"], name: "index_match_results_on_user_id"
  end

  create_table "poke_cards", force: :cascade do |t|
    t.string "name"
    t.string "img_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rooms", force: :cascade do |t|
    t.integer "user_id"
    t.integer "target_user_id"
    t.string "name"
    t.integer "status", limit: 1, default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["target_user_id"], name: "index_rooms_on_target_user_id"
    t.index ["user_id"], name: "index_rooms_on_user_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "ip_address"
    t.string "user_agent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_sessions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email_address", null: false
    t.string "password_digest", null: false
    t.integer "rate_point", default: 1500
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email_address"], name: "index_users_on_email_address", unique: true
  end

  create_table "users_poke_cards", force: :cascade do |t|
    t.integer "user_id"
    t.integer "poke_card_id"
    t.integer "count", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["poke_card_id"], name: "index_users_poke_cards_on_poke_card_id"
    t.index ["user_id"], name: "index_users_poke_cards_on_user_id"
  end

  add_foreign_key "deck_recipes", "users"
  add_foreign_key "deck_recipes_poke_cards", "deck_recipes"
  add_foreign_key "deck_recipes_poke_cards", "poke_cards"
  add_foreign_key "decks", "users"
  add_foreign_key "decks_poke_cards", "decks"
  add_foreign_key "decks_poke_cards", "poke_cards"
  add_foreign_key "match_results", "users"
  add_foreign_key "match_results", "users", column: "target_user_id"
  add_foreign_key "rooms", "users"
  add_foreign_key "rooms", "users", column: "target_user_id"
  add_foreign_key "sessions", "users"
  add_foreign_key "users_poke_cards", "poke_cards"
  add_foreign_key "users_poke_cards", "users"
end
