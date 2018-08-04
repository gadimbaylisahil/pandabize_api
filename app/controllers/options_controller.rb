class OptionsController < ApplicationController
	def index
		options = find_bicycle.options
		render json: OptionSerializer.new(options).serialized_json, status: :ok
	end
	
	def show
		option = find_option
		render json: OptionSerializer.new(option).serialized_json, status: :ok
	end
	
	def create
		option = find_bicycle.options.create!(option_params)
		render json: OptionSerializer.new(option).serialized_json, status: :created
	end
	
	def update
		find_option.update!(option_params)
		head(:ok)
	end
	
	def destroy
		option = find_option
		option.destroy!
		head(:no_content)
	end
	
	private
	
	def find_bicycle
		Bicycle.find_by!(id: params[:bicycle_id])
	end
	
	def find_option
		find_bicycle.options.find_by!(id: params[:id])
	end
	
	def option_params
		params.require(:option).permit(:name, :bicycle_id)
	end
end