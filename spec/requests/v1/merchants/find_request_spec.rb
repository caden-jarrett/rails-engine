require 'rails_helper'

describe "The Merchant Search API" do
  it "sends a single merchant as a response" do
    create_list(:merchant, 1, name: "Aaron Inc")
    create_list(:merchant, 1, name: "Todd Inc")
    create_list(:merchant, 1, name: "Peter Inc")
    create_list(:merchant, 1, name: "Patrick Inc")

    get '/api/v1/merchants/find', params: { name: 'aa'}
    
    merchant = JSON.parse(response.body, symbolize_names: true)


    expect(response.status).to eq(200)

    expect(merchant[:data]).to have_key(:id)
    expect(merchant[:data][:attributes][:name]).to be_a(String)
  end

  describe 'sad path' do
        it "sends a single merchant as a response" do
            create_list(:merchant, 1, name: "Aaron Inc")
            create_list(:merchant, 1, name: "Todd Inc")
            create_list(:merchant, 1, name: "Peter Inc")
            create_list(:merchant, 1, name: "Patrick Inc")

            get '/api/v1/merchants/find', params: { name: '$$'}
            
            merchant = JSON.parse(response.body, symbolize_names: true)


            expect(merchant[:errors]).to eq("expected null to be an object")
        end
    end
end 