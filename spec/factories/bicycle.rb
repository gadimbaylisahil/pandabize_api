FactoryBot.define do
  factory :bicycle do
    name { Faker::Commerce.product_name }
    description { Faker::Lorem.sentence }

    factory :bicycle_with_filled_option do
      after(:create) do |bicycle|
        create(:option_with_option_values, bicycle: bicycle)
      end
    end
  end
end
