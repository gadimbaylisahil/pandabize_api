class Bicycle < ApplicationRecord
	has_many :variants, inverse_of: :bicycle, dependent: :destroy
	has_many :options,  inverse_of: :bicycle, dependent: :destroy
end