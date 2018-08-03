class OptionValue < ApplicationRecord
	has_many :single_option_values, dependent: :destroy
	has_many :variants, through: :single_option_values, dependent: :destroy
end