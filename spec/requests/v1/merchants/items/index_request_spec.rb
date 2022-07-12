require 'rails_helper'

describe "The Item Index API" do
  it "sends a list of a merchants items as a response" do
    create_list(:merchant, 3)
    
    
    get api_v1_merchant_items_path(Merchant.last.id)

    expect(response).to be_successful

    items = JSON.parse(response.body, symbolize_names: true)

    expect(items[:data].count).to eq(5)

    items[:data].each do |item|
      expect(item).to have_key(:id)
      expect(item[:attributes]).to have_key(:merchant_id)
      expect(item[:attributes][:name]).to be_an(String)

      expect(item[:attributes][:description]).to be_an(String)
      expect(item[:attributes][:unit_price]).to be_an(Float)
    end
  end
end 