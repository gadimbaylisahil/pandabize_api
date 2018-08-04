require "rails_helper"
describe Option, type: :request do
  describe "#GET bicycle/:id/options" do
    it "responds with options" do
      bicycle = FactoryBot.create(:bicycle_with_filled_option)
      get "/bicycles/#{bicycle.id}/options"
      expect(response.body).to eq(OptionSerializer.new(bicycle.options).serialized_json)
    end

    it "responds with status code 200" do
      bicycle = FactoryBot.create(:bicycle_with_filled_option)
      get "/bicycles/#{bicycle.id}/options"
      expect(response.status).to eq(200)
    end
  end

  describe "#GET bicycle/:id/options/:id" do
    it "responds with option" do
      bicycle = FactoryBot.create(:bicycle_with_filled_option)
      option  = bicycle.options.first
      get "/bicycles/#{bicycle.id}/options/#{option.id}"
      expect(response.body).to eq(OptionSerializer.new(option).serialized_json)
    end

    it "responds with status code 200" do
      bicycle = FactoryBot.create(:bicycle_with_filled_option)
      option = bicycle.options.first
      get "/bicycles/#{bicycle.id}/options/#{option.id}"
      expect(response.status).to eq(200)
    end
  end

  describe "#POST /bicycles/:id/options" do
    it "creates the option" do
      valid_option_params = get_json(resource: "option", filename: "valid_params")
      bicycle = FactoryBot.create(:bicycle)
      post "/bicycles/#{bicycle.id}/options", params: valid_option_params
      expect(bicycle.options.last.name).to eq(valid_option_params["option"]["name"])
    end

    it "regenerates variants" do
      valid_option_params = get_json(resource: "option", filename: "valid_params")
      bicycle = FactoryBot.create(:bicycle)
      post "/bicycles/#{bicycle.id}/options", params: valid_option_params
      variant_count = bicycle.variants.where.not(is_initial: true).count
      expect(variant_count).to eq(bicycle.options.last.option_values.count)
    end

    it "responds with option" do
      valid_option_params = get_json(resource: "option", filename: "valid_params")
      bicycle = FactoryBot.create(:bicycle)
      post "/bicycles/#{bicycle.id}/options", params: valid_option_params
      expect(response.body).to eq(OptionSerializer.new(bicycle.options.last).serialized_json)
    end

    it "responds with status code" do
      valid_option_params = get_json(resource: "option", filename: "valid_params")
      bicycle = FactoryBot.create(:bicycle)
      post "/bicycles/#{bicycle.id}/options", params: valid_option_params
      expect(response.status).to eq(201)
    end
  end

  describe "#PATCH/PUT /bicycles/:id/options/:id" do
    it "updates the option" do
      valid_option_params = get_json(resource: "option", filename: "valid_params")
      bicycle = FactoryBot.create(:bicycle_with_filled_option)
      patch "/bicycles/#{bicycle.id}/options/#{bicycle.options.last.id}", params: valid_option_params
      expect(bicycle.options.last.name).to eq(valid_option_params["option"]["name"])
    end

    it "responds with status code 200" do
      valid_option_params = get_json(resource: "option", filename: "valid_params")
      bicycle = FactoryBot.create(:bicycle_with_filled_option)
      patch "/bicycles/#{bicycle.id}/options/#{bicycle.options.last.id}", params: valid_option_params
      expect(response.status).to eq(200)
    end
  end

  describe "#DELETE /bicycles/:id/options/:id" do
    it "destroys the option" do
      bicycle = FactoryBot.create(:bicycle_with_filled_option)
      delete "/bicycles/#{bicycle.id}/options/#{bicycle.options.last.id}"
      expect(bicycle.options.count).to eq(0)
    end

    it "responds with status code 204" do
      bicycle = FactoryBot.create(:bicycle_with_filled_option)
      delete "/bicycles/#{bicycle.id}/options/#{bicycle.options.last.id}"
      expect(response.status).to eq(204)
    end
  end
end
