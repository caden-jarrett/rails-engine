require 'rails_helper'

describe "The Merchant Search API" do
  it "sends a single merchant as a response" do
    create_list(:merchant, 1, name: "Aaron Inc")
    create_list(:merchant, 1, name: "Todd Inc")
    create_list(:merchant, 1, name: "Peter Inc")
    create_list(:merchant, 1, name: "Patrick Inc")

    get '/api/v1/merchants/find', params: { name: 'aa'}
    
    expect(response).to be_succesful
  end
end 