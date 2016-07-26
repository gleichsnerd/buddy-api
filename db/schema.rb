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

ActiveRecord::Schema.define(version: 20160725225120) do

  create_table "letters", force: :cascade do |t|
    t.integer  "sent_from_id"
    t.integer  "sent_to_id"
    t.string   "subject"
    t.string   "content"
    t.integer  "mailbox_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["mailbox_id"], name: "index_letters_on_mailbox_id"
    t.index ["sent_from_id"], name: "index_letters_on_sent_from_id"
    t.index ["sent_to_id"], name: "index_letters_on_sent_to_id"
  end

  create_table "mailboxes", force: :cascade do |t|
    t.string   "user"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sent_froms", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "letter_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["letter_id"], name: "index_sent_froms_on_letter_id"
    t.index ["user_id"], name: "index_sent_froms_on_user_id"
  end

  create_table "sent_tos", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "letter_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["letter_id"], name: "index_sent_tos_on_letter_id"
    t.index ["user_id"], name: "index_sent_tos_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
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
    t.string   "auth_token",             default: ""
    t.index ["auth_token"], name: "index_users_on_auth_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end