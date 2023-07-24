class PokemonsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def show
    @pokemon = Pokemon.find(params[:id])
    render json: @pokemon
  end

  def pokedex
    render json: Pokemon.where(pokedex_id: params[:id]).to_a
  end

  def search
    puts "SEEEEEARCCCH SEARCH"
    render json: Pokemon.where(filtered_params).to_a
  end

  def index #with pagy
    @pagination_mode = "pagy"
    @pagy, @pokemons = pagy((Pokemon.all), items: 20)
  end

  def index_alternate #to show an alternate paging (all datatable, all preloaded)
    @pagination_mode = "datatable"
    poke_all = Pokemon.all
    @pagy, @pokemons = pagy((poke_all), items: poke_all.count)
  end

  def all
    @pokemons = Pokemon.all
    render json: @pokemons
  end

  #no "new" because no UI
  def create
    @pokemon = Pokemon.create(filtered_params)
    head :created
  end

  #set values with specific id in table
  def update
    @pokemon = Pokemon.find(params[:id])
    @pokemon.update!(filtered_params)
    head :no_content
  end

  def destroy
    Pokemon.find(params[:id]).destroy!
    head :no_content
  end

  private def filtered_params
    params.permit(*Pokemon.column_names)
  end

end
