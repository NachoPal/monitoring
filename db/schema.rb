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

ActiveRecord::Schema.define(version: 20171002131036) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string   "name"
    t.string   "surname"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "currencies", force: :cascade do |t|
    t.string   "name"
    t.string   "name_long"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "markets", force: :cascade do |t|
    t.string   "name"
    t.integer  "primary_currency_id"
    t.integer  "secondary_currency_id"
    t.decimal  "price",                 precision: 16, scale: 8
    t.decimal  "weighted_bid_mean",     precision: 16, scale: 8
    t.decimal  "weighted_ask_mean",     precision: 16, scale: 8
    t.decimal  "volume",                precision: 16, scale: 8
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.index ["primary_currency_id"], name: "index_markets_on_primary_currency_id", using: :btree
    t.index ["secondary_currency_id"], name: "index_markets_on_secondary_currency_id", using: :btree
  end

  create_table "orderrs", force: :cascade do |t|
    t.integer  "transactionn_id"
    t.string   "type"
    t.string   "uuid"
    t.decimal  "quantity",           precision: 16, scale: 8
    t.decimal  "quantity_remaining", precision: 16, scale: 8
    t.decimal  "limit_price",        precision: 16, scale: 8
    t.boolean  "open"
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.index ["transactionn_id"], name: "index_orderrs_on_transactionn_id", using: :btree
  end

  create_table "tests", force: :cascade do |t|
    t.integer  "account_id"
    t.decimal  "threshold_of_gain"
    t.decimal  "threshold_of_lost"
    t.decimal  "sky_rocket_gain"
    t.decimal  "sky_rocket_period_seg"
    t.decimal  "trend_threshold"
    t.integer  "percentile_volume"
    t.integer  "get_rid_off_after_min"
    t.integer  "quarantine_to_buy_min"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["account_id"], name: "index_tests_on_account_id", using: :btree
  end

  create_table "transactionns", force: :cascade do |t|
    t.integer  "account_id"
    t.integer  "market_id"
    t.decimal  "benefit",    precision: 16, scale: 8
    t.decimal  "percentage", precision: 16, scale: 8
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["account_id"], name: "index_transactionns_on_account_id", using: :btree
    t.index ["market_id"], name: "index_transactionns_on_market_id", using: :btree
  end

  create_table "wallets", force: :cascade do |t|
    t.integer  "account_id"
    t.integer  "currency_id"
    t.decimal  "balance",     precision: 16, scale: 8
    t.decimal  "available",   precision: 16, scale: 8
    t.decimal  "pending",     precision: 16, scale: 8
    t.string   "address"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.index ["account_id"], name: "index_wallets_on_account_id", using: :btree
    t.index ["currency_id"], name: "index_wallets_on_currency_id", using: :btree
  end

end
