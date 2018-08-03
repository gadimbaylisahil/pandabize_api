class Option < ApplicationRecord
	belongs_to :bicycle
	has_many :option_values, dependent: :destroy
end