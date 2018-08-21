class SingleOptionValue < ApplicationRecord
  belongs_to :variant, inverse_of: :single_option_values
  belongs_to :option_value, inverse_of: :single_option_values

  after_destroy { |sov| sov.variant.destroy }

  validates :variant_id, presence: true
  validates :option_value_id, presence: true, uniqueness: { scope: :variant_id }
end
