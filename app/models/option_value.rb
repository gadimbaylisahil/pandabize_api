class OptionValue < ApplicationRecord
  belongs_to :option, inverse_of: :option_values
  has_many :single_option_values, inverse_of: :option_value, dependent: :destroy
  has_many :variants, through: :single_option_values, dependent: :destroy

  validates :name, presence: true, uniqueness: { scope: :option_id, case_sensitive: false }
end
