class CreatePokemons < ActiveRecord::Migration[7.0]
  def up
    create_table :pokemons do |t|
      #t.id implicit
      t.integer :pokedex_id, null: false, index: true
      t.string :name, null: false
      t.string :type1, null: false #other table could be done for that ... ?
      t.string :type2
      t.integer :total, null: false #todo : warning if total incoherent (sum of other fields)
      t.integer :hp, null: false
      t.integer :attack, null: false
      t.integer :defense, null: false
      t.integer :sp_atk, null: false
      t.integer :sp_def, null: false
      t.integer :speed, null: false
      t.integer :generation, null: false
      t.boolean :legendary, null: false
    end
  end

  def down
    drop_table :pokemons, if_exists: true
  end
end
