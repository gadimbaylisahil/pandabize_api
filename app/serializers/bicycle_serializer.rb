class BicycleSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :description
  has_many :variants
  has_many :options

  attributes :options do |bicycle|
    bicycle.options
  end
  
  attributes :option_values do |bicycle|
    bicycle.option_values
  end
end
