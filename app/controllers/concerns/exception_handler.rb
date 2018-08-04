module ExceptionHandler
  extend ActiveSupport::Concern

  included do
    # Define custom handlers
    rescue_from ActiveRecord::RecordInvalid, with: :four_twenty_two

    rescue_from ActiveRecord::RecordNotFound do |exception|
      render json: { message: exception.message }, status: :not_found
    end
  end

  private

  def four_twenty_two(exception)
    render json: { message: exception.message }, status: :unprocessable_entity
  end

  def unauthorized_request(exception)
    render json: { message: exception.message }, status: :unauthorized
  end
end
