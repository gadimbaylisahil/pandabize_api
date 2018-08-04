class VariantSerializer
  include FastJsonapi::ObjectSerializer
  attributes :price_cents, :sku
  belongs_to :product
  has_many :option_values, through: :single_option_values
end
