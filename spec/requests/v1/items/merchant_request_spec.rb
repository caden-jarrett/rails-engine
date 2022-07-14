require 'rails_helper'

describe 'Item Merchant API' do
    it 'returns the merchant of the item as a response' do
        merchant = create(:merchant)

        get "/api/v1/items/#{Item.last.id}/merchant"

        expect(response).to be_successful

        merchant = JSON.parse(response.body, symbolize_names: true)

        expect(merchant[:data]).to have_key(:id)
        expect(merchant[:data][:attributes][:name]).to be_a(String)
    end

    describe 'sad path' do
        it "responds with a 404 error, meaning we dont have a merchant with that id" do
            create_list(:merchant, 1)

            get "/api/v1/items/1000000000000000/merchant"
            
            expect(response.status).to eq(404)
        end
    end 

end