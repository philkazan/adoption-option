class PetsController < ApplicationController
  before_action :set_pet, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show, :index]

  def index
    @pets = Pet.all
  end

  def show
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pet
      @pet = Pet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    # def pet_params
    #   params.require(:pet).permit(:name, :description,  :user_id).merge(user_id: current_user.id)
    # end

    def editable_by?(user)
      user == self.user || user.try(:admin?)
    end

    def destroyable_by?(user)
      user.admin?
    end

end
