require "rails_helper"
describe SingleOptionValue, type: :model do
  describe "Creation" do
    subject { FactoryBot.create(:single_option_value) }
    it { is_expected.to be_valid }
  end

  describe "Relationships" do
    it { is_expected.to belong_to(:option_value) }
    it { is_expected.to belong_to(:variant) }
  end
end
