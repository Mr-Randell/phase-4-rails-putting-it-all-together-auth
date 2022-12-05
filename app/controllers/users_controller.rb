class UsersController < ApplicationController
rescue_from ActiveRecord::RecordInvalid, with: :invalid_records
skip_before_action :authorize, only: :create

  def create
    user = User.create!(user_params)
    if user.valid?
      session[:user_id] ||= user.id
      render json: user, status: :created
    else
      invalid_records
    end
  end

  def show
    # user = User.find_by(id: session[:user_id])
    # if user
    #   return render json: user, status: 201
    # else
    #   render json: { error: "Unauthorized! Kindliy Login..." }, status: 401
    # end
    render json: @current_user
  end

  private

  def user_params
    params.permit(:username, :password, :image_url, :bio)
  end

  def invalid_records(e)
    render json: {errors: e.record.errors.full_messages}, status: :unprocessable_entity
    # render json: e.record.errors.full_messages, status: :unprocessable_entity
  end
end
