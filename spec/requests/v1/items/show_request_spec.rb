require 'rails_helper'

describe "The Item Show API" do
  it "sends a single item as a response" do
    create_list(:merchant, 1)

    get api_v1_item_path(Item.last.id)
    
    expect(response).to be_successful

    item = JSON.parse(response.body, symbolize_names: true)

  
    expect(item).to have_key(:id)
    expect(item[:id]).to eq(Item.last.id)
    expect(item[:id]).to be_a(String)
    expect(item[:attributes]).to have_key(:merchant_id)
    expect(item[:attributes][:name]).to be_an(String)
    expect(item[:attributes][:description]).to be_an(String)
    expect(item[:attributes][:unit_price]).to be_an(Float)
  end
end 