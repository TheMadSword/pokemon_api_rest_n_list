require 'csv'

module PokemonsHelper
  def import_pokemon(filename)
    start_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)
    ActiveRecord::Base.transaction do
      #Note: if file was much bigger reading file & using foreach may be more appropriate to save memory
      # For 800 records, ~0.38 sec with foreach, vs bulk ~0.11 sec
      data = CSV.parse(File.read(filename), headers: true)
      data_to_insert = data.map { |line|
        {
          pokedex_id: line["#"],
          name: line["Name"],
          type1: line["Type 1"],
          type2: line["Type 2"],
          total: line["Total"],
          hp: line["HP"],
          attack: line["Attack"],
          defense: line["Defense"],
          sp_atk: line["Sp. Atk"],
          sp_def: line["Sp. Def"],
          speed: line["Speed"],
          generation: line["Generation"],
          legendary: line["Legendary"]
        }
      }
      Pokemon.insert_all(data_to_insert)
      puts "Created #{data.count} pokemons to database"
    end

    end_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)
    puts "Transaction took #{end_time - start_time} seconds"
  end
end
