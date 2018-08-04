class Bicycle < ApplicationRecord
	has_many :variants, inverse_of: :bicycle, dependent: :destroy
	has_many :options,  inverse_of: :bicycle, dependent: :destroy
	
	# Generates variants for the Bicycle.
	def generate_variants(price_cents = nil)
		initial_variant = variants.find_by(is_initial: true)
		grp_combinations = grouping_combinations
		grp_combinations.each do |combination|
 			variant = variants.create(price_cents: price_cents || initial_variant.price_cents)
			if combination.respond_to?(:each)
				combination.each do |option_value_id|
					variant.single_option_values.create!(option_value_id: option_value_id)
				end
			else
				variant.single_option_values.create!(option_value_id: combination)
			end
		end
	end
	
	# Regenerations only happens when option added after creation
	def regenerate_variants(price_cents)
		variants.where.not(is_initial: true).destroy_all
		generate_variants(price_cents)
	end
	
	def build_initial_variant(price_cents)
		variants.build(price_cents: price_cents, is_initial: true)
	end
	
	private
	
	# Returns possible groupings of option_values.
	def option_value_groupings
		option_value_groupings = {}
		
		options.each do |option|
			option_value_groupings[option.id] = option.option_values.map(&:id)
		end
		option_value_groupings.values
	end
	
	# Returns all combinations of option_value groupings.
	def grouping_combinations
		opt_value_groupings = option_value_groupings
		opt_value_groupings.inject(opt_value_groupings.shift) do |left, right|
			left.product(right).map(&:flatten)
		end
	end
	
	# Returns current combinations of variant combinations
	def variant_combinations
		variant_combinations = {}
		variants.where(is_initial: false).each do |variant|
			variant_combinations[variant.id] = variant.option_values.map(&:id)
		end
		
		variant_combinations.values
	end
end