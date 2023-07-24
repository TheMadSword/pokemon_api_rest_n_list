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

ActiveRecord::Schema[7.0].define(version: 2023_07_23_042637) do
  create_table "pokemons", force: :cascade do |t|
    t.integer "pokedex_id", null: false
    t.string "name", null: false
    t.string "type1", null: false
    t.string "type2"
    t.integer "total", null: false
    t.integer "hp", null: false
    t.integer "attack", null: false
    t.integer "defense", null: false
    t.integer "sp_atk", null: false
    t.integer "sp_def", null: false
    t.integer "speed", null: false
    t.integer "generation", null: false
    t.boolean "legendary", null: false
    t.index ["pokedex_id"], name: "index_pokemons_on_pokedex_id"
  end

end
