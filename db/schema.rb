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

ActiveRecord::Schema.define(version: 20140301231939) do

  create_table "blocks", force: true do |t|
    t.integer  "schedule_id"
    t.integer  "duration"
    t.string   "day"
    t.integer  "start_time"
    t.integer  "end_time"
    t.boolean  "immutable"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "schedules", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "student_group_memberships", force: true do |t|
    t.integer  "student_group_id"
    t.integer  "block_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "student_group_memberships", ["block_id"], name: "index_student_group_memberships_on_block_id", using: :btree
  add_index "student_group_memberships", ["student_group_id"], name: "index_student_group_memberships_on_student_group_id", using: :btree

  create_table "student_groups", force: true do |t|
    t.string   "description"
    t.string   "grade"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teacher_memberships", force: true do |t|
    t.integer  "teacher_id"
    t.integer  "block_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "teacher_memberships", ["block_id"], name: "index_teacher_memberships_on_block_id", using: :btree
  add_index "teacher_memberships", ["teacher_id"], name: "index_teacher_memberships_on_teacher_id", using: :btree

  create_table "teachers", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "subject"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
