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

ActiveRecord::Schema.define(version: 2019_05_12_113607) do

  create_table "mushrooms", force: :cascade do |t|
    t.string "edible-status"
    t.string "cap-shape"
    t.string "cap-surface"
    t.string "cap-color"
    t.string "bruises"
    t.string "odor"
    t.string "gill-attachment"
    t.string "gill-spacing"
    t.string "gill-size"
    t.string "gill-color"
    t.string "stalk-shape"
    t.string "stalk-root"
    t.string "stalk-surface-above-ring"
    t.string "stalk-surface-below-ring"
    t.string "stalk-color-above-ring"
    t.string "stalk-color-below-ring"
    t.string "veil-type"
    t.string "veil-color"
    t.string "ring-number"
    t.string "ring-type"
    t.string "spore-print-color"
    t.string "population"
    t.string "habitat"
  end

end
