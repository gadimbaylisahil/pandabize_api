FactoryBot.define do
  factory :variant do
    bicycle
    sku "AB123"
    price_cents { Faker::Number.number(6) }
  end
end
