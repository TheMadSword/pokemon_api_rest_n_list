Rails.application.routes.draw do

  get "/pokemons/search", to: "pokemons#search"
  get "/pokemons/all", to: "pokemons#all"
  #must be after search
  resources :pokemons, except: [:new]
  get "/pokemons/pokedex/:id", to: "pokemons#pokedex"
  get "/pokemons_alternate", to: "pokemons#index_alternate"

end
