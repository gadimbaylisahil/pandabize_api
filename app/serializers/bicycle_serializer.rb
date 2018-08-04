class BicycleSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :description
end
