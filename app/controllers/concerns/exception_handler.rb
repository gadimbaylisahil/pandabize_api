module ExceptionHandler
	extend ActiveSupport::Concern
	
	included do
		# Define custom handlers
		rescue_from ActiveRecord::RecordInvalid, with: :four_twenty_two
		
		rescue_from ActiveRecord::RecordNotFound do |e|
			render json: { message: e.message }, status: :not_found
		end
	end
	
	private
	
	def four_twenty_two(e)
		render json: { message: e.message }, status: :unprocessable_entity
	end
	
	def unauthorized_request(e)
		render json: { message: e.message }, status: :unauthorized
	end
end