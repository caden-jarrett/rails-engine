require 'rails_helper'

describe "The Merchant Index API" do
  it "sends a list of merchants as a response" do
    create_list(:merchant, 3)

    get '/api/v1/merchants'
    
    expect(response).to be_successful

    merchants = JSON.parse(response.body, symbolize_names: true)

     expect(merchants.count).to eq(3)

    merchants.each do |merchant|
      expect(merchant).to have_key(:id)
      expect(merchant[:name]).to be_an(String)
    end
  end
end 