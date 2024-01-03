# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2024_01_02_083202) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "chats", force: :cascade do |t|
    t.text "message", null: false
    t.bigint "lesson_area_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lesson_area_id"], name: "index_chats_on_lesson_area_id"
    t.index ["user_id"], name: "index_chats_on_user_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "title", null: false
    t.integer "code", null: false
    t.integer "level", null: false
    t.bigint "department_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "credit_load", null: false
    t.index ["department_id"], name: "index_courses_on_department_id"
  end

  create_table "deans", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "gender", null: false
    t.integer "years_of_admin_exp", null: false
    t.string "number_of_publications", null: false
    t.string "highest_academic_qualification", null: false
    t.string "photo", null: false
    t.string "rank", null: false
    t.text "bio", null: false
    t.bigint "school_id", null: false
    t.integer "age", null: false
    t.bigint "phone_number", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "facebook"
    t.string "email", null: false
    t.string "linkedIn"
    t.string "twitter"
    t.string "wellfound"
    t.string "instagram"
    t.string "medium"
    t.string "nationality", null: false
    t.index ["school_id"], name: "index_deans_on_school_id"
    t.index ["user_id"], name: "index_deans_on_user_id"
  end

  create_table "departments", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "school_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["school_id"], name: "index_departments_on_school_id"
  end

  create_table "grades", force: :cascade do |t|
    t.integer "value", null: false
    t.bigint "student_id", null: false
    t.bigint "course_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_grades_on_course_id"
    t.index ["student_id"], name: "index_grades_on_student_id"
  end

  create_table "hods", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "gender", null: false
    t.integer "years_of_admin_exp", null: false
    t.string "number_of_publications", null: false
    t.string "highest_academic_qualification", null: false
    t.string "photo", null: false
    t.string "rank", null: false
    t.text "bio", null: false
    t.bigint "department_id", null: false
    t.integer "age", null: false
    t.bigint "phone_number", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "facebook"
    t.string "email", null: false
    t.string "linkedIn"
    t.string "twitter"
    t.string "wellfound"
    t.string "instagram"
    t.string "medium"
    t.string "nationality", null: false
    t.index ["department_id"], name: "index_hods_on_department_id"
    t.index ["user_id"], name: "index_hods_on_user_id"
  end

  create_table "lecturer_courses", force: :cascade do |t|
    t.bigint "lecturer_id"
    t.bigint "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_lecturer_courses_on_course_id"
    t.index ["lecturer_id"], name: "index_lecturer_courses_on_lecturer_id"
  end

  create_table "lecturers", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "gender", null: false
    t.string "core_discipline", null: false
    t.string "number_of_publications", null: false
    t.string "highest_academic_qualification", null: false
    t.string "photo", null: false
    t.string "rank", null: false
    t.text "bio", null: false
    t.bigint "department_id", null: false
    t.integer "age", null: false
    t.bigint "phone_number", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "facebook"
    t.string "email", null: false
    t.string "linkedIn"
    t.string "twitter"
    t.string "wellfound"
    t.string "instagram"
    t.string "medium"
    t.string "nationality", null: false
    t.index ["department_id"], name: "index_lecturers_on_department_id"
    t.index ["user_id"], name: "index_lecturers_on_user_id"
  end

  create_table "lesson_areas", force: :cascade do |t|
    t.bigint "student_id", null: false
    t.bigint "course_id", null: false
    t.bigint "lecturer_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_lesson_areas_on_course_id"
    t.index ["lecturer_id"], name: "index_lesson_areas_on_lecturer_id"
    t.index ["student_id"], name: "index_lesson_areas_on_student_id"
  end

  create_table "lesson_submissions", force: :cascade do |t|
    t.text "links", null: false
    t.bigint "lesson_area_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lesson_area_id"], name: "index_lesson_submissions_on_lesson_area_id"
    t.index ["user_id"], name: "index_lesson_submissions_on_user_id"
  end

  create_table "schools", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "students", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "photo", null: false
    t.bigint "phone_number", null: false
    t.integer "level", null: false
    t.string "gender", null: false
    t.bigint "department_id", null: false
    t.integer "age"
    t.text "bio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "facebook"
    t.string "email", null: false
    t.string "linkedIn"
    t.string "twitter"
    t.string "wellfound"
    t.string "instagram"
    t.string "medium"
    t.string "nationality", null: false
    t.index ["department_id"], name: "index_students_on_department_id"
    t.index ["user_id"], name: "index_students_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "jti", null: false
    t.string "role", null: false
    t.string "username", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["jti"], name: "index_users_on_jti", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["role"], name: "index_users_on_role"
    t.index ["username"], name: "index_users_on_username"
  end

  add_foreign_key "chats", "lesson_areas"
  add_foreign_key "chats", "users"
  add_foreign_key "courses", "departments"
  add_foreign_key "deans", "schools"
  add_foreign_key "deans", "users"
  add_foreign_key "departments", "schools"
  add_foreign_key "grades", "courses"
  add_foreign_key "grades", "students"
  add_foreign_key "hods", "departments"
  add_foreign_key "hods", "users"
  add_foreign_key "lecturer_courses", "courses"
  add_foreign_key "lecturer_courses", "lecturers"
  add_foreign_key "lecturers", "departments"
  add_foreign_key "lecturers", "users"
  add_foreign_key "lesson_areas", "courses"
  add_foreign_key "lesson_areas", "lecturers"
  add_foreign_key "lesson_areas", "students"
  add_foreign_key "lesson_submissions", "lesson_areas"
  add_foreign_key "lesson_submissions", "users"
  add_foreign_key "students", "departments"
  add_foreign_key "students", "users"
end
