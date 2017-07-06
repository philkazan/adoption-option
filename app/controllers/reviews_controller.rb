class ReviewsController < ApplicationController

  before_action :set_review, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index]

  def show
  end

  def new
    @review = Review.new
    @food = Food.find(params[:food_id])
  end

  def create
    @review = Review.new(review_params)
    @food = Food.find(params[:food_id])
    respond_to do |format|
      if @review.save
        format.html { redirect_to @food, notice: 'Review was successfully created.' }
        format.json { render :show, location: @review }
      else
        flash[:alert] = @review.errors.full_messages.to_sentence
        format.html { render :new }
        format.json { render json: @review.errors }
      end
    end
  end

  def edit
    unless @review.editable_by?(current_user)
      flash[:alert] = "You may only edit your own reviews"
      redirect_to :root
    else
      @food = Food.find(params[:food_id])
    end
  end

  def update
    @food = Food.find(params[:food_id])
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to @food, notice: 'Review was successfully updated.' }
        format.json { render :show, location: @review }
      else
        format.html { render :edit }
        format.json { render json: @review.errors }
      end
    end
  end

  def destroy
    unless @review.destroyable_by?(current_user)
      flash[:alert] = "You do not have permission to delete that review."
      redirect_to :root
    else
      @review.destroy
      respond_to do |format|
        format.html { redirect_to reviews_url, notice: 'Review was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:rating, :body, :user_id, :food_id).merge(user_id: current_user.id)
    end
end
