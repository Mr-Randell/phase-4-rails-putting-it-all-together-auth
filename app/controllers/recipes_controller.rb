class RecipesController < ApplicationController
  rescue_from ActiveRecord::RecordInvalid, with: :invalid_records
  # skip_before_action :authorize, only: :create
  
  def index
    if @current_user
      render json: Recipe.all, status: :created
    else
      render json: {error: "Not logged in..."}, status: :created
    end      
  end
  
  def create
    if @current_user
      recipe = Recipe.create!(recipe_params)
      if recipe.valid?
        render json: recipe, status: :created
      else
        render json: {error: "Unauthorized"}, status: :unauthorized
      end
    end
    # @user = User.find_by(id: session[:user_id])
    # recipe = Recipe.create(recipe_params.merge({user_id: @user.id}))
    # if recipe.valid?
    #   render json: recipe, status: :created
    # else
    #   render json: {errors: recipe.errors.full_messages}, status: :unprocessable_entity
    # end
  end

  private

  def recipe_params
    params.permit(:recipe, :title, :instructions, :minutes_to_complete)
  end

  def invalid_records(e)
    render json: {errors: e.record.errors.full_messages}, status: :unprocessable_entity
    # render json: e.record.errors.full_messages, status: :unprocessable_entity
  end
end
