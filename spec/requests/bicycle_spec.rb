require 'rails_helper'
describe Bicycle, type: :request do
	describe '#GET bicycles/' do
		let!(:bicycles) { FactoryBot.create_list(:bicycle, 5) }
		before do
			get '/bicycles'
		end
		
		it 'responds with bicycles' do
			expect(response.body).to eq(BicycleSerializer.new(bicycles).serialized_json)
		end
		
		it 'response with status code 200' do
			expect(response.status).to eq(200)
		end
	end
	
	describe '#POST bicycles/' do
		context 'when params are valid' do
			let(:valid_bicycle_params) { get_json(resource: 'bicycle', filename: 'valid_params') }
			before do
				post '/bicycles', params: valid_bicycle_params
			end
			
			it 'creates a bicycle' do
				expect(Bicycle.last.name).to eq(valid_bicycle_params["bicycle"]["name"])
				expect(Bicycle.last.description).to eq(valid_bicycle_params["bicycle"]["description"])
			end
			
			it 'responds with bicycle' do
				expect(response.body).to eq(BicycleSerializer.new(Bicycle.last).serialized_json)
			end
			
			it 'responds with status code 201' do
				expect(response.status).to eq(201)
			end
		end
	end
end