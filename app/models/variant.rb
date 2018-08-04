class Variant < ApplicationRecord
	belongs_to :bicycle, inverse_of: :variants
	
	has_many :single_option_values, inverse_of: :variant, dependent: :destroy
	has_many :option_values, through: :single_option_values, dependent: :destroy
end