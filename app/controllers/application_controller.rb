class ApplicationController < ActionController::API
  include ActionController::Cookies
  rescue_from ActiveRecord::RecordInvalid, with: :invalid_records
  before_action :authorize

  private

  def invalid_records(exception)
    render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
  end
  
  def authorize
    @current_user = User.find_by(id: session[:user_id])
    return render json: { errors: ["Not authorized"] }, status: :unauthorized unless @current_user
  end

end
