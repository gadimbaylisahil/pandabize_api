class OptionValueSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name
  belongs_to :option
  has_many :variants, through: :single_option_values
end
