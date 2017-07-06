class Api::V1::AppsController < ApplicationController

  def create
    pet = Pet.find(params[:pet_id])

    current_app = current_user.apps.where(pet_id: pet).first

    if current_app == nil
      App.create(pet: pet, user: current_user)
    else
      App.destroy(current_app.id)
    end
  end
end
