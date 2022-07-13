require 'rails_helper'

describe "The Item Index API" do
  it "sends a list of items as a response" do
    create_list(:merchant, 3)

    get '/api/v1/items'
    
    expect(response).to be_successful

    items = JSON.parse(response.body, symbolize_names: true)

     expect(items[:data].count).to eq(15)

    items[:data].each do |item|
      expect(item).to have_key(:id)
      expect(item[:id]).to be_a(String)
      expect(item[:attributes]).to have_key(:merchant_id)
      expect(item[:attributes][:name]).to be_an(String)
      expect(item[:attributes][:description]).to be_an(String)
      expect(item[:attributes][:unit_price]).to be_an(Float)
    end
  end
end 