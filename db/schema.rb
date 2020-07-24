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

ActiveRecord::Schema.define(version: 2020_07_23_173800) do

  create_table "applicants", force: :cascade do |t|
    t.integer "user_id"
    t.integer "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_applicants_on_team_id"
    t.index ["user_id"], name: "index_applicants_on_user_id"
  end

  create_table "comment_rooms", force: :cascade do |t|
    t.integer "sport_id"
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sport_id"], name: "index_comment_rooms_on_sport_id"
  end

  create_table "comments", force: :cascade do |t|
    t.integer "user_id"
    t.integer "comment_room_id"
    t.text "sentence"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["comment_room_id"], name: "index_comments_on_comment_room_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "title"
    t.string "body"
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "inquiries", force: :cascade do |t|
    t.string "name"
    t.string "message"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "likes", force: :cascade do |t|
    t.integer "comment_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["comment_id"], name: "index_likes_on_comment_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.integer "user_id"
    t.integer "room_id"
    t.text "content", null: false
    t.string "title", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_id"], name: "index_messages_on_room_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "prefectures", force: :cascade do |t|
    t.integer "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rooms", force: :cascade do |t|
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_rooms_on_user_id"
  end

  create_table "sports", force: :cascade do |t|
    t.string "sport_genre", null: false
    t.string "image_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "team_comment_rooms", force: :cascade do |t|
    t.integer "team_id"
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_team_comment_rooms_on_team_id"
  end

  create_table "team_comments", force: :cascade do |t|
    t.integer "team_comment_room_id"
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_comment_room_id"], name: "index_team_comments_on_team_comment_room_id"
  end

  create_table "team_members", force: :cascade do |t|
    t.integer "user_id"
    t.integer "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_team_members_on_team_id"
    t.index ["user_id"], name: "index_team_members_on_user_id"
  end

  create_table "teams", force: :cascade do |t|
    t.integer "sport_id"
    t.string "image_id"
    t.integer "applicant"
    t.string "area", null: false
    t.string "team_name", null: false
    t.text "information"
    t.string "stance"
    t.text "explanation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "prefecture_id"
    t.index ["prefecture_id"], name: "index_teams_on_prefecture_id"
    t.index ["sport_id"], name: "index_teams_on_sport_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "token"
    t.string "meta"
    t.string "provider"
    t.string "uid"
    t.string "nicname"
    t.string "name", null: false
    t.integer "age"
    t.integer "sex"
    t.text "introduction"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
