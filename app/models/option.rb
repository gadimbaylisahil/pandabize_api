class Option < ApplicationRecord
  belongs_to :bicycle, inverse_of: :options
  has_many :option_values, inverse_of: :option, dependent: :destroy

  validates :name, presence: true
end
