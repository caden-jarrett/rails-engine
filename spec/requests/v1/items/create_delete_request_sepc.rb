require 'rails_helper'

describe 'Create/Delete Item API' do
  it "can create a new item" do
    create_list(:merchant, 1)
    
    item_params = {
                    name: 'Axe',
                    description: 'Cutting stuff',
                    unit_price: 15.00,
                    merchant_id: 1
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

  it "can destroy an book" do
    merchant = create(:merchant)
    item = merchant.items.last

    expect(Item.count).to eq(5)

    delete "/api/v1/item/#{item.id}"
    
    deleted_item_response = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(deleted_item_response[:id]).to eq(item.id)
    expect(Item.count).to eq(4)
    expect{Item.find(item.id)}.to raise_error(ActiveRecord::RecordNotFound)
  end
end