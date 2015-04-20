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

ActiveRecord::Schema.define(version: 20150414223854) do

  create_table "digitizations", force: :cascade do |t|
    t.string   "user_digitization", limit: 255
    t.integer  "repetition",        limit: 4
    t.integer  "user_validation",   limit: 4
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.integer  "word_id",           limit: 4
  end

  create_table "players", force: :cascade do |t|
    t.string   "email",                  limit: 255
    t.string   "name",                   limit: 255
    t.integer  "score",                  limit: 4,   default: 0
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "authentication_token",   limit: 255
  end

  add_index "players", ["email"], name: "index_players_on_email", unique: true, using: :btree
  add_index "players", ["reset_password_token"], name: "index_players_on_reset_password_token", unique: true, using: :btree

  create_table "rounds", force: :cascade do |t|
    t.integer  "hint_requested", limit: 4
    t.integer  "hint_sent",      limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "word_id",        limit: 4
    t.integer  "hinter_id",      limit: 4
    t.integer  "solver_id",      limit: 4
  end

  create_table "validations", force: :cascade do |t|
    t.string   "user_digitization", limit: 255
    t.string   "word_image_url",    limit: 255
    t.integer  "word_id",           limit: 4
    t.integer  "certinity_rate",    limit: 4
    t.boolean  "known",             limit: 1
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "waitings", force: :cascade do |t|
    t.integer  "waiting_player_id", limit: 4
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "word_hints", force: :cascade do |t|
    t.string   "first_hint",  limit: 255
    t.string   "second_hint", limit: 255
    t.string   "third_hint",  limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "words", force: :cascade do |t|
    t.string   "word_image_url",   limit: 255
    t.string   "ocr_digitization", limit: 255
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

end
