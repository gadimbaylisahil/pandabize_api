require "rails_helper"
describe OptionValue, type: :model do
  describe "Creation" do
    subject { FactoryBot.create(:option_value) }
    it { is_expected.to be_valid }
  end

  describe "Relationships" do
    it { is_expected.to belong_to(:option) }
    it { is_expected.to have_many(:single_option_values) }
    it { is_expected.to have_many(:variants).through(:single_option_values).dependent(:destroy) }
  end
end
