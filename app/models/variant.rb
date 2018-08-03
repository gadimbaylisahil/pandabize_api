class Variant < ApplicationRecord
	belongs_to :bicycle
	
	has_many :single_option_values, dependent: :destroy
	has_many :option_values, through: :single_option_values, dependent: :destroy
end