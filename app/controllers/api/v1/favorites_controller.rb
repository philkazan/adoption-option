class Api::V1::FavoritesController < ApplicationController

  def create
    pet = Pet.find(params[:pet_id])

    current_favorite = current_user.favorites.where(pet_id: pet).first

    if current_favorite == nil
      Favorite.create(pet: pet, user: current_user)
    else
      Favorite.destroy(current_favorite.id)
    end
  end

  def destroy
    binding.pry
  end
end
