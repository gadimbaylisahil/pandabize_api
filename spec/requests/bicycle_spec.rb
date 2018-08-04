require 'rails_helper'
describe Bicycle, type: :request do
	describe '#GET bicycles/' do
		
		it 'responds with bicycles' do
			bicycles = FactoryBot.create_list(:bicycle, 5)
			get '/bicycles'
			expect(response.body).to eq(BicycleSerializer.new(bicycles).serialized_json)
		end
		
		it 'response with status code 200' do
			get '/bicycles'
			expect(response.status).to eq(200)
		end
	end
	
	describe '#GET bicycles/:id' do
		it 'responds with bicycle' do
			bicycle = FactoryBot.create(:bicycle)
			get "/bicycles/#{bicycle.id}"
			expect(response.body).to eq(BicycleSerializer.new(bicycle).serialized_json)
		end
		
		it 'responds with status code 200' do
			bicycle = FactoryBot.create(:bicycle)
			get "/bicycles/#{bicycle.id}"
			expect(response.status).to eq(200)
		end
	end
	
	describe '#POST bicycles/' do
		context 'when params are valid' do
			it 'creates a bicycle' do
				valid_bicycle_params = get_json(resource: 'bicycle', filename: 'valid_params')
				post '/bicycles', params: valid_bicycle_params
				expect(Bicycle.last.name).to eq(valid_bicycle_params["bicycle"]["name"])
				expect(Bicycle.last.description).to eq(valid_bicycle_params["bicycle"]["description"])
			end
			
			it 'responds with bicycle' do
				valid_bicycle_params = get_json(resource: 'bicycle', filename: 'valid_params')
				post '/bicycles', params: valid_bicycle_params
				expect(response.body).to eq(BicycleSerializer.new(Bicycle.last).serialized_json)
			end
			
			it 'responds with status code 201' do
				valid_bicycle_params = get_json(resource: 'bicycle', filename: 'valid_params')
				post '/bicycles', params: valid_bicycle_params
				expect(response.status).to eq(201)
			end
		end
	end
	
	describe '#PATCH/PUT bicycles/:id' do
		context 'when params are valid' do
			it 'updates the bicycle' do
				valid_bicycle_params = get_json(resource: 'bicycle', filename: 'valid_params')
				bicycle = FactoryBot.create(:bicycle)
				patch "/bicycles/#{bicycle.id}", params: valid_bicycle_params
				expect(Bicycle.last.name).to eq(valid_bicycle_params["bicycle"]["name"])
				expect(Bicycle.last.description).to eq(valid_bicycle_params["bicycle"]["description"])
			end
			
			it 'responds with status code 200' do
				valid_bicycle_params = get_json(resource: 'bicycle', filename: 'valid_params')
				bicycle = FactoryBot.create(:bicycle)
				patch "/bicycles/#{bicycle.id}", params: valid_bicycle_params
				expect(response.status).to eq(200)
			end
		end
	end
	
	describe '#DELETE bicycles/:id' do
		it 'destroys the bicycle' do
			bicycle = FactoryBot.create(:bicycle)
			delete "/bicycles/#{bicycle.id}"
			expect(Bicycle.count).to eq(0)
		end
		
		it 'responds with status code 204' do
			bicycle = FactoryBot.create(:bicycle)
			delete "/bicycles/#{bicycle.id}"
			expect(response.status).to eq(204)
		end
	end
end