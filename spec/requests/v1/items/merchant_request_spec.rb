require 'rails_helper'

describe 'Item Merchant API' do
    it 'returns the merchant of the item as a response' do
        merchant = create(:merchant)

        get "/api/v1/items/#{Item.last.id}/merchant/#{merchant.id}"

        expect(response).to be_successful

        merchant = JSON.parse(response.body, symbolize_names: true)

        expect(merchant).to be_a(Merchant)
        expect(merchant[data]).to have_key(:id)
        expect(merchant[:data][:attributes][:name]).to be_a(String)
    end

end