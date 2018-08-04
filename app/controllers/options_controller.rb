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
		option = build_option
		build_option_values_and_save(option)
		regenerate_variants
		render json: OptionSerializer.new(option).serialized_json, status: :created
	end
	
	def update
		find_option.update!(name: option_params[:name])
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
	
	def build_option
		find_bicycle.options.build(name: option_params[:name])
	end
	
	def build_option_values_and_save(option)
		if option_params[:option_values].any?
			option_params[:option_values].each do |option_value|
				option.option_values.build(name: option_value[:name])
			end
		end
		option.save!
	end
	
	def regenerate_variants
		find_bicycle.regenerate_variants(option_params[:price_cents])
	end
	
	def find_option
		find_bicycle.options.find_by!(id: params[:id])
	end
	
	def option_params
		params.require(:option).permit(:name, :price_cents, option_values: [:name])
	end
end