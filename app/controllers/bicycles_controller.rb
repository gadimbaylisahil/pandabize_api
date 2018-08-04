class BicyclesController < ApplicationController
	
	def index
		bicycles = Bicycle.all
		render json: BicycleSerializer.new(bicycles).serialized_json, status: :ok
	end
	
	def show
		bicycle = find_bicycle
		render json: BicycleSerializer.new(bicycle).serialized_json, status: :ok
	end
	
	def create
		bicycle = Bicycle.create!(bicycle_params)
		render json: BicycleSerializer.new(bicycle).serialized_json, status: :created
	end
	
	def update
		find_bicycle.update!(bicycle_params)
		head(:ok)
	end
	
	def destroy
		find_bicycle.destroy!
		head(:no_content)
	end
	
	private
	
	def find_bicycle
		Bicycle.find_by!(id: params[:id])
	end
	
	def bicycle_params
		params.require(:bicycle).permit(:name, :description)
	end
end