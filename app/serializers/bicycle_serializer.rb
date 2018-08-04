class BicycleSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :description
  has_many :variants
  has_many :options
end
