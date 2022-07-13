require 'rails_helper'

describe 'Create Item API' do
  it "can create a new item" do
    create_list(:merchant, 1)
    
    item_params = {
                    name: 'Murder on the Orient Express',
                    description: 'Agatha Christie',
                    unit_price: 'mystery',
                    merchant_id: '1'
                  }
    headers = {"CONTENT_TYPE" => "application/json"}

    post "/api/v1/items", headers: headers, params: JSON.generate(item: item_params)
    new_item = Item.last
    binding.pry
    expect(response).to be_successful
    expect(new_item.name).to eq(item_params[:name])
    expect(new_item.description).to eq(item_params[:description])
    expect(new_item.unit_price).to eq(item_params[:unit_price])
    expect(new_item.merchant_id).to eq(item_params[:merchant_id])
  end
end