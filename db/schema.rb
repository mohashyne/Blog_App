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


ActiveRecord::Schema[7.0].define(version: 2023_09_27_155320) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "adminpack"
  enable_extension "pgagent"
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.bigint "user_id"

ActiveRecord::Schema[7.0].define(version: 2023_09_29_214543) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "animales", primary_key: "id_animal", id: :integer, default: nil, force: :cascade do |t|
    t.string "nombre", limit: 30
  end

  create_table "animals", id: :serial, force: :cascade do |t|
    t.string "name", limit: 100
    t.date "date_of_birth"
    t.integer "escape_attempts"
    t.boolean "neutered"
    t.decimal "weight_kg", precision: 5, scale: 2
  end

  create_table "comments", force: :cascade do |t|
    t.bigint "author_id"

    t.bigint "post_id"
    t.text "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false

    t.index ["post_id"], name: "index_comments_on_post_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "likes", force: :cascade do |t|
    t.decimal "user_id"
    t.decimal "post_id"

    t.index ["author_id"], name: "index_comments_on_author_id"
    t.index ["post_id"], name: "index_comments_on_post_id"
  end

  create_table "cuentas", primary_key: "numero_cuenta", id: :integer, default: nil, force: :cascade do |t|
    t.decimal "balance"
    t.check_constraint "balance >= 0.00", name: "cuentas_balance_check"
  end

  create_table "likes", force: :cascade do |t|
    t.integer "user_id"
    t.integer "post_id"

    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end



  create_table "pizzas", id: :integer, default: nil, force: :cascade do |t|
    t.integer "stock"
    t.decimal "costo"
    t.string "nombre", limit: 25
    t.check_constraint "stock::numeric >= 0.00", name: "pizzas_stock_check"
  end


  create_table "posts", force: :cascade do |t|
    t.bigint "author_id"
    t.string "title"
    t.text "text"
    t.integer "comments_counter"
    t.integer "likes_counter"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_posts_on_author_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "photo"
    t.text "bio"
    t.decimal "post_counter"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end


  add_foreign_key "comments", "posts"
  add_foreign_key "comments", "users"
  add_foreign_key "posts", "users", column: "author_id"

  create_table "ventas", id: false, force: :cascade do |t|
    t.string "cliente", limit: 60
    t.date "fecha"
    t.decimal "monto"
    t.integer "id_pizza"
  end

  add_foreign_key "comments", "posts"
  add_foreign_key "comments", "users", column: "author_id"
  add_foreign_key "posts", "users", column: "author_id"
  add_foreign_key "ventas", "pizzas", column: "id_pizza", name: "ventas_id_pizza_fkey"
end
