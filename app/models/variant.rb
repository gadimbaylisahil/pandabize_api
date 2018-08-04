class Variant < ApplicationRecord
	belongs_to :bicycle, inverse_of: :variants
	
	validates :price_cents, numericality: { greater_than_or_equal_to: 0 }
	
	has_many :single_option_values, inverse_of: :variant, dependent: :destroy
	has_many :option_values, through: :single_option_values
end