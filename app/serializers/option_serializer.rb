class OptionSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name
  belongs_to :bicycle
end
