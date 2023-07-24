require 'csv'
require_relative 'import_pokemons'

namespace :pokemons do

  desc "imports pokemons from the passed filename (arg) into db"
  task :import, [:csv_filename] => [:environment] do |t, args|
    ActiveRecord::Base.logger = Logger.new STDOUT

    # We could let natural erroring be done here, but I like to handle errors
    if args[:csv_filename].blank?
      abort "CSV filename ('csv_filename') not specified ; aborting raketask"
    end
    if !File.exist?(args[:csv_filename])
      abort "File #{args[:csv_filename]} not found ; aborting raketask"
    end

    ImportPokemons::csv_into_db(args[:csv_filename])
  end

end
