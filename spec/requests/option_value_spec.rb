require "rails_helper"
describe OptionValue, type: :request do
  describe "#GET /bicycles/:id/options/:id/option_values" do
    it "responds with option_values" do
      bicycle = FactoryBot.create(:bicycle_with_filled_option)
      option = bicycle.options.last
      option_values = option.option_values
      get "/bicycles/#{bicycle.id}/options/#{option.id}/option_values"
      expect(response.body).to eq(OptionValueSerializer.new(option_values).serialized_json)
    end

    it "responds with status code 200" do
      bicycle = FactoryBot.create(:bicycle_with_filled_option)
      option = bicycle.options.last
      get "/bicycles/#{bicycle.id}/options/#{option.id}/option_values"
      expect(response.status).to eq(200)
    end
  end

  describe "#GET /bicycles/:id/options/:id/option_values/:id" do
    it "responds with option_value" do
      bicycle = FactoryBot.create(:bicycle_with_filled_option)
      option = bicycle.options.last
      option_value = option.option_values.first
      get "/bicycles/#{bicycle.id}/options/#{option.id}/option_values/#{option_value.id}"
      expect(response.body).to eq(OptionValueSerializer.new(option_value).serialized_json)
    end

    it "responds with status code 200" do
      bicycle = FactoryBot.create(:bicycle_with_filled_option)
      option = bicycle.options.last
      option_value = option.option_values.first
      get "/bicycles/#{bicycle.id}/options/#{option.id}/option_values/#{option_value.id}"
      expect(response.status).to eq(200)
    end
  end

  describe "#DELETE /bicycles/:id/options/:id/option_values/:id" do
    it "deletes the option_value" do
      bicycle = FactoryBot.create(:bicycle_with_filled_option)
      option = FactoryBot.create(:option, bicycle: bicycle)
      option_value = FactoryBot.create(:option_value, option: option)
      delete "/bicycles/#{bicycle.id}/options/#{option.id}/option_values/#{option_value.id}"
      expect(option.option_values.count).to eq(0)
    end

    it "responds with status code 204" do
      bicycle = FactoryBot.create(:bicycle_with_filled_option)
      option = FactoryBot.create(:option, bicycle: bicycle)
      option_value = FactoryBot.create(:option_value, option: option)
      delete "/bicycles/#{bicycle.id}/options/#{option.id}/option_values/#{option_value.id}"
      expect(response.status).to eq(204)
    end
  end
end
