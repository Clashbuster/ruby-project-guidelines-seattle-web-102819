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

ActiveRecord::Schema.define(version: 20191114195705) do

  create_table "definitions", force: :cascade do |t|
    t.integer "word_id"
    t.integer "user_id"
    t.string  "record1"
    t.string  "record2"
    t.string  "record3"
    t.string  "record4"
    t.string  "record5"
    t.string  "record6"
    t.string  "record7"
    t.string  "record8"
    t.string  "record9"
    t.string  "record10"
  end

  create_table "users", force: :cascade do |t|
    t.string  "name"
    t.integer "age"
    t.integer "number_of_propositions"
    t.string  "bio"
  end

  create_table "words", force: :cascade do |t|
    t.string  "name"
    t.integer "word_length"
    t.integer "num_of_definitions"
  end

end
