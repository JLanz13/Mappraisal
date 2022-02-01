class ApplicationController < ActionController::API
  include ActionController::Cookies
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from ActiveRecord::RecordInvalid, with: :invalid_record

  private

  def invalid_record(invalid)
    render json: {error: invalid.record.errors.full_messages}, status: :unprocessable_entity
  end

  def current_user
    User.find_by_id(session[:user_id])
  end

end
