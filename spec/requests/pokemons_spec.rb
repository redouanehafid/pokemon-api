require 'rails_helper'

describe 'Pokemons Controller API', type: :request do

    describe 'GET /pokemons' do
        before do
           FactoryBot.create(:pokemon, name: 'Bulbizar', type_1: 'type_1', type_2: 'type_2', total: 100, hp: 100, attack: 100, defense: 100, sp_atk: 100, dp_def: 100, speed: 100, generation: 100, legendary: false)
           FactoryBot.create(:pokemon, name: 'Alakazam', type_1: 'type_1', type_2: 'type_2', total: 100, hp: 100, attack: 100, defense: 100, sp_atk: 100, dp_def: 100, speed: 100, generation: 100, legendary: true)
        end

        it 'returns all pokemons' do
            get '/api/v1/pokemons'

            expect(response).to have_http_status(:success)
            expect(response_body['data'].size).to eq(2)
        end

        it 'returns a subset of pokemons based on limit' do
            get '/api/v1/pokemons', params: { limit: 1 }

            expect(response).to have_http_status(:success)
            expect(response_body['data'].size).to eq(1)
        end

        it 'returns a subset of pokemons based on limit and offset' do
            get '/api/v1/pokemons', params: { limit: 1, offset: 1 }

            expect(response).to have_http_status(:success)
            expect(response_body['data'].size).to eq(1)
        end
    end
    
    describe 'POST /pokemons' do
        it 'create a new pokemon' do
            expect {
                post '/api/v1/pokemons', params: {
                    pokemon: {name: 'Salamech'}
                }
            }.to change { Pokemon.count }.from(0).to(1)

            expect(response).to have_http_status(:created)
        end
    end

    describe 'DELETE /pokemons/:id' do
        let!(:pokemon) { FactoryBot.create(:pokemon, name: 'Charmeleon') }

        it 'deletes a pokemon' do
            expect {
                delete "/api/v1/pokemons/#{pokemon.id}"
            }.to change { Pokemon.count }.from(1).to(0)

            expect(response).to have_http_status(:no_content)
        end
    end
end

describe 'Pokemons Model API', type: :model do

    context 'validation model' do
      it 'ensure primitif type of legendary respect string' do
        pokemon = Pokemon.new(name: "Salamech", legendary: false).save
        expect(pokemon).to eq(true)
      end

      it 'ensure name of pokemon presence' do
        pokemon = Pokemon.new(name: "").save
        expect(pokemon).to eq(false)
      end

      it 'ensureuniqueness of pokemon name' do
        pokemon_1 = Pokemon.new(name: "Pikatchu").save
        pokemon_2 = Pokemon.new(name: "Pikatchu").save

        expect(pokemon_1).to eq(true)
        expect(pokemon_2).to eq(false)
      end
    end
end