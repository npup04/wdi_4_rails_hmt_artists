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

ActiveRecord::Schema.define(version: 20150203181525) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "albums", force: :cascade do |t|
    t.string   "title"
    t.string   "genre"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "artists", force: :cascade do |t|
    t.string   "name"
    t.boolean  "union_member", default: true
    t.date     "dob"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "song_contributions", force: :cascade do |t|
    t.integer "song_id"
    t.integer "artist_id"
    t.string  "role"
  end

  add_index "song_contributions", ["artist_id"], name: "index_song_contributions_on_artist_id", using: :btree
  add_index "song_contributions", ["song_id"], name: "index_song_contributions_on_song_id", using: :btree

  create_table "songs", force: :cascade do |t|
    t.string   "title"
    t.integer  "duration"
    t.decimal  "price"
    t.integer  "album_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "songs", ["album_id"], name: "index_songs_on_album_id", using: :btree

  add_foreign_key "song_contributions", "artists"
  add_foreign_key "song_contributions", "songs"
  add_foreign_key "songs", "albums"
end
