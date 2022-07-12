require 'rails_helper'

describe "The Merchant Show API" do
  it "responds with a single merchant following the merchant id" do
    create_list(:merchant, 3)

    get '/api/v1/merchants/1'
    
    expect(response).to be_successful

    merchant = JSON.parse(response.body, symbolize_names: true)

    expect(merchant[:data].count).to eq(1)

    
    expect(merchant).to have_key(:id)
    expect(merchant[:attributes][:name]).to be_an(String)
  end
end 