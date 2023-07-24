require "rails_helper"

RSpec.describe PokemonsController, type: :controller do
  let(:pokemon1) { FactoryBot.create :pokemon }

  describe 'GET #index' do
    it 'returns 200 with 2 pokemons' do
      get :index, :format => :html
      expect(response).to have_http_status(200)
      expect(assigns(:pokemons).count).to eq 2 #defined in pokemons.yml
    end
  end

  describe 'GET #index_alternate' do
    it 'returns 200 with 2 pokemons' do
      get :index_alternate, :format => :html
      expect(response).to have_http_status(200)
      expect(assigns(:pokemons).count).to eq 2 #defined in pokemons.yml
    end
  end

  describe 'GET #all' do
    it 'returns 200 with 2 pokemons' do
      get :all, :format => :html
      expect(response).to have_http_status(200)
      expect(assigns(:pokemons).count).to eq 2 #defined in pokemons.yml
    end
  end

  describe 'GET #show' do
    it 'should return the pokemon with given id' do
      get :show, params: { id: pokemon1.id }
      expect(response).to have_http_status(200)
      expect(assigns(:pokemon)).to  have_attributes(id: pokemon1.id,
                                                    pokedex_id: pokemon1.pokedex_id,
                                                    name: pokemon1.name)
    end
  end

  describe 'POST #create' do
    it 'should create a pokemon with given id data' do
      new_attrs = pokemon1.attributes.merge({"id" => 147})
      post :create, params: new_attrs
      expect(response).to have_http_status(201)
      expect(assigns(:pokemon)).to have_attributes(new_attrs)
    end
  end

  describe 'UPDATE #index' do
    it 'returns 204 and change attributes' do
      new_name = pokemon1.name + "anothername"
      old_name = pokemon1.name
      patch :update, params: { id: pokemon1.id, pokedex_id: 1337, name: new_name }
      expect(response).to have_http_status(204)
      expect(assigns(:pokemon)).to have_attributes(pokedex_id: 1337, name: new_name)
    end
  end

  describe 'DELETE #index' do
    it 'returns 204' do
      A_LONG_CONSTANT_NAME = "unnompashasardeux"
      delete :destroy, params: { id: pokemon1.id }
      expect(response).to have_http_status(204)
    end
  end

end