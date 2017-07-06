class Api::V1::PetsController < ApplicationController
  def index
    render json: Pet.all.order('created_at DESC')
  end
end
