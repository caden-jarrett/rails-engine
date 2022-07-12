require 'rails_helper'

describe "The Merchant Show API" do
    describe 'happy path' do
        it "responds with a single merchant following the merchant id" do
            create_list(:merchant, 3)

            get api_v1_merchant_path(Merchant.last.id)
            
            expect(response).to be_successful

            merchant = JSON.parse(response.body, symbolize_names: true)

            
            expect(merchant[:data]).to have_key(:id)
            expect(merchant[:data][:attributes][:name]).to be_an(String)
        end
    end 

    describe 'sad path' do
        it "responds with a 404 error, meaning we dont have a merchant with that id" do
            create_list(:merchant, 1)

            get api_v1_merchant_path(1000000000000000000000000001)
            
            expect(response.status).to eq(404)
        end
    end 
end