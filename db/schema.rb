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

ActiveRecord::Schema.define(version: 20150227213455) do

  create_table "accounts", force: true do |t|
    t.string   "battletag"
    t.string   "account_id"
    t.boolean  "admin",      default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "key",                        null: false
  end

  create_table "characters", force: true do |t|
    t.integer  "account_id"
    t.integer  "guild_id"
    t.string   "name"
    t.string   "realm"
    t.string   "image_url"
    t.integer  "level"
    t.integer  "item_level"
    t.integer  "race_id"
    t.integer  "class_id"
    t.integer  "gender_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "characters", ["account_id"], name: "index_characters_on_account_id"
  add_index "characters", ["guild_id"], name: "index_characters_on_guild_id"
  add_index "characters", ["name", "realm"], name: "index_characters_on_name_and_realm"

  create_table "class_roles", force: true do |t|
    t.integer "role_id"
    t.integer "class_id"
  end

  add_index "class_roles", ["class_id"], name: "index_class_roles_on_class_id"
  add_index "class_roles", ["role_id"], name: "index_class_roles_on_role_id"

  create_table "guilds", force: true do |t|
    t.string   "name"
    t.string   "realm"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "backgroun_color"
    t.integer  "icon"
    t.integer  "border"
    t.string   "icon_color"
    t.string   "border_color"
    t.string   "background_color"
  end

  add_index "guilds", ["name", "realm"], name: "index_guilds_on_name_and_realm"

  create_table "logins", force: true do |t|
    t.string   "key",        null: false
    t.string   "redirect",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "logins", ["key", "created_at"], name: "index_logins_on_key_and_created_at"

  create_table "permissions", force: true do |t|
    t.integer  "permissioned_id",   null: false
    t.string   "permissioned_type", null: false
    t.string   "level",             null: false
    t.string   "key",               null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "raids", force: true do |t|
    t.string   "name",                              null: false
    t.datetime "date",                              null: false
    t.text     "note"
    t.boolean  "finalized",         default: false, null: false
    t.integer  "account_id",                        null: false
    t.integer  "groups",            default: 1,     null: false
    t.integer  "size",              default: 30,    null: false
    t.integer  "tanks",             default: 2,     null: false
    t.integer  "healers",           default: 6,     null: false
    t.integer  "requiredLevel"
    t.integer  "requiredItemLevel"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "hidden",            default: true,  null: false
    t.integer  "guild_id"
  end

  add_index "raids", ["account_id"], name: "index_raids_on_account_id"
  add_index "raids", ["guild_id"], name: "index_raids_on_guild_id"

  create_table "roles", force: true do |t|
    t.string   "name"
    t.string   "slug"
    t.string   "icon"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles_signups", id: false, force: true do |t|
    t.integer "role_id"
    t.integer "signup_id"
  end

  add_index "roles_signups", ["role_id"], name: "index_roles_signups_on_role_id"
  add_index "roles_signups", ["signup_id"], name: "index_roles_signups_on_signup_id"

  create_table "sessions", force: true do |t|
    t.integer  "account_id",   null: false
    t.string   "key",          null: false
    t.string   "access_token", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["account_id"], name: "index_sessions_on_account_id"

  create_table "signups", force: true do |t|
    t.integer  "raid_id"
    t.integer  "character_id"
    t.string   "note"
    t.boolean  "preferred",    default: false, null: false
    t.boolean  "seated",       default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "role_id"
  end

  add_index "signups", ["character_id"], name: "index_signups_on_character_id"
  add_index "signups", ["raid_id", "character_id"], name: "index_signups_on_character_id_and_raid_id", unique: true
  add_index "signups", ["raid_id"], name: "index_signups_on_raid_id"

end
