require 'rails_helper'
describe Bicycle, type: :model do
	describe 'Creation' do
		subject { FactoryBot.create(:bicycle) }
		it { is_expected.to be_valid }
	end
	
	describe 'Relationships' do
		it { is_expected.to have_many(:options).dependent(:destroy) }
		it { is_expected.to have_many(:variants).dependent(:destroy) }
	end
end