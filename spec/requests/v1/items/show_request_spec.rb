require 'rails_helper'

describe "The Item Show API" do
    describe 'happy path' do
        it "sends a single item as a response" do
            create_list(:merchant, 1)

            get api_v1_item_path(Item.last.id)
            
            expect(response).to be_successful

            item = JSON.parse(response.body, symbolize_names: true)

        
            expect(item[:data]).to have_key(:id)
            expect(item[:data][:id]).to eq(Item.last.id.to_s)
            expect(item[:data][:id]).to be_a(String)
            expect(item[:data][:attributes]).to have_key(:merchant_id)
            expect(item[:data][:attributes][:name]).to be_an(String)
            expect(item[:data][:attributes][:description]).to be_an(String)
            expect(item[:data][:attributes][:unit_price]).to be_an(Float)
        end
    end

    describe 'sad path' do
        it "sends a 404 error as a response" do
            create_list(:merchant, 1)

            get api_v1_item_path(10000000000000000000000000000001)
            
            expect(response.status).to eq(404)
        end
    end
end 