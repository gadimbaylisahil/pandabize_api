class BicyclesController < ApplicationController
	
	def create
		bicycle = Bicycle.create!(bicycle_params)
		render json: BicycleSerializer.new(bicycle).serialized_json, status: :created
	end
	
	private
	
	def bicycle_params
		params.require(:bicycle).permit(:name, :description)
	end
end