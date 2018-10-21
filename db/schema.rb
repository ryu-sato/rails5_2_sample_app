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

ActiveRecord::Schema.define(version: 2018_10_21_051954) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.integer "resource_id"
    t.string "author_type"
    t.integer "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "command_log_sets", force: :cascade do |t|
    t.string "name", null: false
    t.string "hostname", null: false
    t.integer "lock_version", default: 0
    t.index [nil], name: "index_command_log_sets_on_ticket_id"
  end

  create_table "command_logs", force: :cascade do |t|
    t.string "name", null: false
    t.string "result", default: "", null: false
    t.integer "command_log_set_id"
    t.integer "lock_version", default: 0
    t.index ["command_log_set_id"], name: "index_command_logs_on_command_log_set_id"
  end

  create_table "comparison_sets", force: :cascade do |t|
    t.string "name", null: false
    t.string "difference", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "ticket_id"
    t.integer "normal_log_set_id"
    t.integer "anomaly_log_set_id"
    t.integer "lock_version", default: 0
    t.index ["anomaly_log_set_id"], name: "index_comparison_sets_on_anomaly_log_set_id"
    t.index ["normal_log_set_id"], name: "index_comparison_sets_on_normal_log_set_id"
    t.index ["ticket_id"], name: "index_comparison_sets_on_ticket_id"
  end

  create_table "comparisons", force: :cascade do |t|
    t.string "difference", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "ticket_id"
    t.integer "normal_log_id"
    t.integer "anomaly_log_id"
    t.integer "lock_version", default: 0
    t.index ["anomaly_log_id"], name: "index_comparisons_on_anomaly_log_id"
    t.index ["normal_log_id"], name: "index_comparisons_on_normal_log_id"
    t.index ["ticket_id"], name: "index_comparisons_on_ticket_id"
  end

  create_table "raw_command_log_sets", force: :cascade do |t|
    t.string "hostname", null: false
    t.boolean "is_normal", default: false, null: false
    t.integer "ticket_id"
    t.integer "command_log_set_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "lock_version", default: 0
    t.index ["command_log_set_id"], name: "index_raw_command_log_sets_on_command_log_set_id"
    t.index ["ticket_id"], name: "index_raw_command_log_sets_on_ticket_id"
  end

  create_table "tickets", force: :cascade do |t|
    t.string "code", null: false
    t.string "maker", null: false
    t.string "hostname", null: false
    t.integer "lock_version", default: 0
  end

end
