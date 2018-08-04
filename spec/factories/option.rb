FactoryBot.define do
	factory :option do
		bicycle
		name "Size"
		
		factory :option_with_option_values do
			after(:create) do |option|
				create(:option_value, name: 'S', option: option)
				create(:option_value, name: 'M', option: option)
				create(:option_value, name: 'L', option: option)
			end
		end
	end
end