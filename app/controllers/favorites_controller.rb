class FavoritesController < ApplicationController
  def create
    pet = Pet.find(params[:pet_id])

    current_favorite = current_user.apps.where(pet_id: pet).first

    if current_app == nil
      Favorite.create(pet: pet, user: current_user)
    else
      Favorite.destroy(current_favorite.id)
    end
  end

  def destroy
    @favorite = Favorite.find params["id"]
    @favorite.destroy
    redirect_to user_path(current_user)

  end
end
