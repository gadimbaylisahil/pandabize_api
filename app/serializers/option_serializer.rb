class OptionSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name
  belongs_to :bicycle

  attribute :option_values do |option|
    option.option_values
  end
end
