class Bicycle < ApplicationRecord
	has_many :variants, dependent: :destroy
	has_many :options, dependent: :destroy
end