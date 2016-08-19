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

ActiveRecord::Schema.define(version: 20160813213426) do

  create_table "address_book_friend_records", force: :cascade do |t|
    t.integer  "address_book_friend_id"
    t.integer  "mailbox_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["address_book_friend_id"], name: "index_address_book_friend_records_on_address_book_friend_id"
    t.index ["mailbox_id"], name: "index_address_book_friend_records_on_mailbox_id"
  end

  create_table "address_book_friends", force: :cascade do |t|
    t.integer  "address_book_id"
    t.integer  "friend_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["address_book_id"], name: "index_address_book_friends_on_address_book_id"
    t.index ["friend_id"], name: "index_address_book_friends_on_friend_id"
  end

  create_table "address_books", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_address_books_on_user_id"
  end

  create_table "letters", force: :cascade do |t|
    t.string   "subject"
    t.string   "content"
    t.integer  "sent_from_user_id"
    t.integer  "sent_to_user_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "mailbox_id"
    t.index ["mailbox_id"], name: "index_letters_on_mailbox_id"
    t.index ["sent_from_user_id"], name: "index_letters_on_sent_from_user_id"
    t.index ["sent_to_user_id"], name: "index_letters_on_sent_to_user_id"
  end

  create_table "locations", force: :cascade do |t|
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mailbox_collections", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_mailbox_collections_on_user_id"
  end

  create_table "mailboxes", force: :cascade do |t|
    t.string   "name"
    t.integer  "mailbox_collection_id"
    t.integer  "location_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["location_id"], name: "index_mailboxes_on_location_id"
    t.index ["mailbox_collection_id"], name: "index_mailboxes_on_mailbox_collection_id"
  end

  create_table "penpals", force: :cascade do |t|
    t.integer  "user_1_id"
    t.integer  "user_2_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_1_id"], name: "index_penpals_on_user_1_id"
    t.index ["user_2_id"], name: "index_penpals_on_user_2_id"
  end

  create_table "sent_from_users", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "letter_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["letter_id"], name: "index_sent_from_users_on_letter_id"
    t.index ["user_id"], name: "index_sent_from_users_on_user_id"
  end

  create_table "sent_to_users", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "letter_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["letter_id"], name: "index_sent_to_users_on_letter_id"
    t.index ["user_id"], name: "index_sent_to_users_on_user_id"
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
