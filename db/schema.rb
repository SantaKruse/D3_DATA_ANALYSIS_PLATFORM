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

ActiveRecord::Schema.define(version: 20180419150910) do

  create_table "viz1s", force: :cascade do |t|
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "measure"
    t.integer  "year"
    t.integer  "start_year"
    t.string   "ethnicity"
    t.string   "sex"
    t.string   "diabetes_type"
    t.integer  "deprivation"
    t.string   "ccg"
    t.string   "baseline_group"
    t.decimal  "measure_result"
  end

  create_table "viz_ones", force: :cascade do |t|
    t.integer  "year"
    t.integer  "start_year"
    t.string   "ethnicity"
    t.string   "sex"
    t.string   "diabetes_type"
    t.integer  "deprivation"
    t.string   "ccg"
    t.string   "baseline_group"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "age"
    t.decimal  "hba1c"
    t.decimal  "chol"
    t.decimal  "egfr"
    t.decimal  "bmi"
    t.decimal  "bp"
    t.string   "patient_id"
  end

end
