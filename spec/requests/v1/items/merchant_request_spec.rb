require 'rails_rspec'

describe 'Item Merchant API' do
    it 'returns the merchant of the item as a response' do
        create(:merchant)

        visit api_v1_items_merchant_path(Item.last.id)

        expect(response).to be_successful

        merchant = JSON.parse(response.body, symbolize_names: true)

        expect(merchant).to be_a(Merchant)
        expect(merchant[data]).to have_key(:id)
        expect(merchant[:data][:attributes][:name]).to be_a(String)
    end

end