require 'rails_helper'
describe Variant, type: :request do
	describe '#GET bicycle/:id/variants/' do
		it 'responds with variants' do
			bicycle = FactoryBot.create(:bicycle)
			variants = FactoryBot.create_list(:variant, 5, bicycle: bicycle)
			get "/bicycles/#{bicycle.id}/variants"
			expect(response.body).to eq(VariantSerializer.new(variants).serialized_json)
		end
		
		it 'responds with status code 200' do
			bicycle = FactoryBot.create(:bicycle)
			FactoryBot.create_list(:variant, 5, bicycle: bicycle)
			get "/bicycles/#{bicycle.id}/variants"
			expect(response.status).to eq(200)
		end
	end
	
	describe '#GET bicycle/:id/variants/:id' do
		it 'responds with variant' do
			bicycle = FactoryBot.create(:bicycle)
			variant = FactoryBot.create(:variant, bicycle: bicycle)
			get "/bicycles/#{bicycle.id}/variants/#{variant.id}"
			expect(response.body).to eq(VariantSerializer.new(variant).serialized_json)
		end
		
		it 'responds with status code 200' do
			bicycle = FactoryBot.create(:bicycle)
			variant = FactoryBot.create(:variant, bicycle: bicycle)
			get "/bicycles/#{bicycle.id}/variants/#{variant.id}"
			expect(response.status).to eq(200)
		end
	end
	
	describe '#PATCH/PUT bicycle/:id/variants/:id' do
		it 'update the variant' do
			valid_variant_params = get_json(resource: 'variant', filename: 'valid_params')
			bicycle = FactoryBot.create(:bicycle)
			variant = FactoryBot.create(:variant, bicycle: bicycle)
			patch "/bicycles/#{bicycle.id}/variants/#{variant.id}", params: valid_variant_params
			expect(Variant.last.price_cents).to eq(valid_variant_params["variant"]["price_cents"])
			expect(Variant.last.sku).to eq(valid_variant_params["variant"]["sku"])
		end
		
		it 'responds with status code 200' do
			valid_variant_params = get_json(resource: 'variant', filename: 'valid_params')
			bicycle = FactoryBot.create(:bicycle)
			variant = FactoryBot.create(:variant, bicycle: bicycle)
			patch "/bicycles/#{bicycle.id}/variants/#{variant.id}", params: valid_variant_params
			expect(response.status).to eq(200)
		end
	end
	
	describe '#DELETE bicycles/:id/variants/:id' do
		it 'destroys the variant' do
			bicycle = FactoryBot.create(:bicycle)
			variant = FactoryBot.create(:variant, bicycle: bicycle)
			delete "/bicycles/#{bicycle.id}/variants/#{variant.id}"
			expect(bicycle.variants.count).to eq(0)
		end
		
		it 'responds with status code 204' do
			bicycle = FactoryBot.create(:bicycle)
			variant = FactoryBot.create(:variant, bicycle: bicycle)
			delete "/bicycles/#{bicycle.id}/variants/#{variant.id}"
			expect(response.status).to eq(204)
		end
	end
end