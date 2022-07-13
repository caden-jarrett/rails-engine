require 'rails_helper'

describe 'Item Update API' do
    it 'can update an existing item' do
        id = create(:merchant).items.last.id
        previous_name = Item.last.name
        item_params = { name: "SPELLBRINGER 9000XL" }
        headers = {"CONTENT_TYPE" => "application/json"}
    
        # We include this header to make sure that these params are passed as JSON rather than as plain text
        patch "/api/v1/items/#{id}", headers: headers, params: JSON.generate({book: item_params})
        item = Item.find_by(id: id)
    
        expect(response).to be_successful
        expect(item.name).to_not eq(previous_name)
        expect(item.name).to eq("SPELLBRINGER 9000XL")
    end
end