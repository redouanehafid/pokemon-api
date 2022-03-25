module Api
  module V1
    class PokemonsController < ApplicationController
      MAX_PAGINATION_COUNT = 100

      def index
        pokemons = Pokemon.limit(limit).offset(params[:offset]).order('created_at DESC');
        render json: {status: 'SUCCESS', message: 'List of pokemons', count: pokemons.size, data: pokemons}, status: :ok
      end
  
      def show
        
        if Pokemon.exists?(params[:id])
          pokemon = Pokemon.find(params[:id])
          render json: {status: 'SUCCESS', message: 'Details of pokemon', data: pokemon}, status: :ok
        else
          render json: {status: 'WARNNING', message: 'Pokemon not found'}, status: :not_found
        end
        
      end
  
      def create
        pokemon = Pokemon.new(pokemon_params)
  
        if pokemon.save
          render json: {status: 'SUCCESS', message: 'Saved pokemon', data:pokemon}, status: :created
        else
          render json: {status: 'ERROR', message: 'Pokemon not saved', data:pokemon.errors}, status: :unprocessable_entity
        end
  
      end
  
      def update
        if Pokemon.exists?(params[:id])
          pokemon = Pokemon.find(params[:id])
          if pokemon.update(pokemon_params)
            render json: {status: 'SUCCESS', message: 'Updated pokemon', data:pokemon}, status: :ok
          else
            render json: {status: 'ERROR', message: 'Pokemon not updated', data:pokemon.errors}, status: :unprocessable_entity
          end
        else
          render json: {status: 'WARNNING', message: 'Pokemon not found'}, status: :not_found
        end
      end
  
      def destroy
        if Pokemon.exists?(params[:id])
          pokemon = Pokemon.find(params[:id])
          pokemon.destroy
          render json: {status: 'SUCCESS', message: 'Deleted pokemon', data:pokemon}, status: :no_content
        else
          render json: {status: 'WARNNING', message: 'Pokemon not found'}, status: :not_found
        end
      end
  
      private

      def limit
        [
          params.fetch(:limit, MAX_PAGINATION_COUNT).to_i,
          MAX_PAGINATION_COUNT
        ].min
      end
  
      def pokemon_params
        params.require(:pokemon).permit(:name, :type_1, :type_2, :total, :hp, :attack, :defense, :sp_atk, :dp_def, :speed, :generation, :legendary)
      end
    end
  end
end

