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

ActiveRecord::Schema.define(version: 2020_09_25_052722) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "blocks", force: :cascade do |t|
    t.text "content"
    t.text "edited_content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "run_id", null: false
    t.index ["run_id"], name: "index_blocks_on_run_id"
  end

  create_table "channels", force: :cascade do |t|
    t.string "name"
    t.string "access_token"
    t.string "refresh_token"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_channels_on_user_id"
  end

  create_table "runs", force: :cascade do |t|
    t.string "state"
    t.integer "cost"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_runs_on_user_id"
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
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "name"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "video_blocks", force: :cascade do |t|
    t.bigint "block_id", null: false
    t.bigint "video_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["block_id"], name: "index_video_blocks_on_block_id"
    t.index ["video_id"], name: "index_video_blocks_on_video_id"
  end

  create_table "video_runs", force: :cascade do |t|
    t.bigint "video_id", null: false
    t.bigint "run_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["run_id"], name: "index_video_runs_on_run_id"
    t.index ["video_id"], name: "index_video_runs_on_video_id"
  end

  create_table "videos", force: :cascade do |t|
    t.text "youtube_id"
    t.string "title"
    t.text "description"
    t.string "miniature"
    t.text "edited_descriptions"
    t.bigint "channel_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["channel_id"], name: "index_videos_on_channel_id"
  end

  add_foreign_key "blocks", "runs"
  add_foreign_key "runs", "users"
  add_foreign_key "video_blocks", "blocks"
  add_foreign_key "video_blocks", "videos"
  add_foreign_key "video_runs", "runs"
  add_foreign_key "video_runs", "videos"
  add_foreign_key "videos", "channels"
end
