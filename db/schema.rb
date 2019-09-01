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

ActiveRecord::Schema.define(version: 2019_08_31_214938) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "items", force: :cascade do |t|
    t.string "title"
    t.date "date"
    t.text "body"
    t.string "url_full_post"
    t.string "url_image"
    t.string "url_document"
    t.string "url_audio"
    t.string "url_video"
    t.text "tagged_as"
    t.text "categorized_under"
    t.string "contact"
    t.string "contact_first_name"
    t.string "contact_last_name"
    t.string "contact_title"
    t.string "contact_phone"
    t.string "contact_email"
    t.string "author_name"
    t.string "author_url"
    t.datetime "posted_date_time"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "scrapes", id: :serial, force: :cascade do |t|
    t.string "name"
  end

end
