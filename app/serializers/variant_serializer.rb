class VariantSerializer
  include FastJsonapi::ObjectSerializer
  attributes :price_cents, :sku
  belongs_to :bicycle
  has_many :option_values, through: :single_option_values

  attribute :option_values do |variant|
    variant.option_values
  end
end
