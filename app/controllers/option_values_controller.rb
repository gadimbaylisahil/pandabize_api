class OptionValuesController < ApplicationController
	def index
		option_values = find_option.option_values
		render json: OptionValueSerializer.new(option_values).serialized_json, status: :ok
	end
	
	def show
		option_value = find_option_value
		render json: OptionValueSerializer.new(option_value).serialized_json, status: :ok
	end
	
	def create
		option_value = find_option.option_values.create!(option_value_params)
		render json: OptionValueSerializer.new(option_value).serialized_json, status: :created
	end
	
	def destroy
		find_option_value.destroy!
		head(:no_content)
	end
	
	private
	
	def find_bicycle
		Bicycle.find_by(id: params[:bicycle_id])
	end
	
	def find_option
		find_bicycle.options.find_by(id: params[:option_id])
	end
	
	def find_option_value
		find_option.option_values.find_by!(id: params[:id])
	end
	
	def option_value_params
		params.require(:option_value).permit(:name)
	end
end