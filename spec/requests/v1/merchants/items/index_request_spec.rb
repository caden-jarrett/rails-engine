require 'rails_helper'

describe "The Item Index API" do
  it "sends a list of a merchants items as a response" do
    create_list(:item, 3)

    get api_v1_merchant_items_path(Merchant.last.id)
    
    expect(response).to be_successful

    merchant = JSON.parse(response.body, symbolize_names: true)

     expect(merchants.items.count).to eq(3)

    merchants.items.each do |item|
      expect(item).to have_key(:id)
      expect(item).to have_key(:merchant_id)
      expect(item[:attributes][:name]).to be_an(String)

      expect(item[:attributes][:description]).to be_an(String)
      expect(item[:attributes][:unit_price]).to be_an(Integer)
    end
  end
end 