require 'rails_helper'
describe Option, type: :model do
	describe 'Creation' do
		subject { FactoryBot.create(:option) }
		it { is_expected.to be_valid }
	end
	
	describe 'Relationships' do
		it { is_expected.to belong_to(:bicycle) }
		it { is_expected.to have_many(:option_values).dependent(:destroy) }
	end
end