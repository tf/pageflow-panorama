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

ActiveRecord::Schema.define(version: 20140915133249) do

  create_table "pageflow_panorama_packages", force: true do |t|
    t.integer  "entry_id"
    t.integer  "uploader_id"
    t.string   "state"
    t.string   "rights"
    t.string   "attachment_on_filesystem_file_name"
    t.string   "attachment_on_filesystem_content_type"
    t.integer  "attachment_on_filesystem_file_size",    limit: 8
    t.datetime "attachment_on_filesystem_updated_at"
    t.string   "attachment_on_s3_file_name"
    t.string   "attachment_on_s3_content_type"
    t.integer  "attachment_on_s3_file_size",            limit: 8
    t.datetime "attachment_on_s3_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "unpacking_progress"
    t.string   "unpacking_error_message"
    t.string   "index_document"
    t.string   "thumbnail_file_name"
    t.string   "thumbnail_content_type"
    t.integer  "thumbnail_file_size"
    t.datetime "thumbnail_updated_at"
  end

  add_index "pageflow_panorama_packages", ["entry_id"], name: "index_pageflow_panorama_packages_on_entry_id", using: :btree
  add_index "pageflow_panorama_packages", ["uploader_id"], name: "index_pageflow_panorama_packages_on_uploader_id", using: :btree

end
