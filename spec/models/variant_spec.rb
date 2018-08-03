require 'rails_helper'
describe Variant, type: :model do
	describe 'Creation' do
		subject { FactoryBot.create(:variant) }
		it { is_expected.to be_valid }
	end
	
	describe 'Relationships' do
		it { is_expected.to belong_to(:bicycle) }
		it { is_expected.to have_many(:single_option_values) }
		it { is_expected.to have_many(:option_values).through(:single_option_values).dependent(:destroy) }
	end
end