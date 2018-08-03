FactoryBot.define do
	factory :bicycle do
		name { Faker::Commerce.product_name }
		description { Faker::Lorem.sentence }
	end
end