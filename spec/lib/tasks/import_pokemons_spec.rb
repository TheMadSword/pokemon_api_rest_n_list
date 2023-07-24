require "rails_helper"
require 'rake'

require_relative '../../../lib/tasks/import_pokemons'

# may need to initialize to initialize stuff : see README.md

RSpec.describe 'ImportPokemons::csv_into_db' do
  it 'increases the number of record upon being inserted' do
    TEST_FILE = "spec/pokemon_partial_test.csv"
    expect(File.exist?(TEST_FILE)).to be true
    poke_count = Pokemon.count
    ImportPokemons::csv_into_db(TEST_FILE)
    assert (Pokemon.count - poke_count == 11) #11 new lines
  end
end