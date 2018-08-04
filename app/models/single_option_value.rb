class SingleOptionValue < ApplicationRecord
  belongs_to :variant
  belongs_to :option_value

  validates :variant_id, presence: true
  validates :option_value_id, presence: true
  validates :option_value_id, uniqueness: { scope: :variant_id }
end
