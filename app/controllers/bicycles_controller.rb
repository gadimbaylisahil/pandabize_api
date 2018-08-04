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
		bicycle = build_bicycle
		build_initial_variant(bicycle)
		build_options_and_save(bicycle)
		generate_variants(bicycle)
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
	
	def build_initial_variant(bicycle)
		bicycle.build_initial_variant(initial_bicycle_params[:price_cents] || 0)
	end
	
	def build_bicycle
		Bicycle.new(name: initial_bicycle_params[:name], description: initial_bicycle_params[:description])
	end
	
	def build_options_and_save(bicycle)
		if initial_bicycle_params[:options].any?
			initial_bicycle_params[:options].each do |option|
				n_option = bicycle.options.build(name: option[:name])
				option[:option_values].each do |option_value|
					n_option.option_values.build(name: option_value[:name])
				end
			end
		end
		bicycle.save!
	end
	
	def generate_variants(bicycle)
		bicycle.generate_variants
	end
	
	def find_bicycle
		Bicycle.find_by!(id: params[:id])
	end
	
	def initial_bicycle_params
		params.require(:bicycle).permit(:name, :description, :price_cents, options: [:name, option_values: [:name]])
	end
	
	def bicycle_params
		params.require(:bicycle).permit(:name, :description)
	end
end