require 'rails_helper'

describe 'Item Update API' do
    it 'can update an existing item' do
        id = create(:merchant).items.last.id
        previous_name = Item.last.name
          item_params = {
                    name: 'Axe'
                  }
        headers = {"CONTENT_TYPE" => "application/json"}
    
        patch "/api/v1/items/#{id}", headers: headers, params: JSON.generate({item: item_params})
        item = Item.find_by(id: id)
    
        expect(response).to be_successful
        expect(item.name).to_not eq(previous_name)
        expect(item.name).to eq("Axe")
    end

    describe 'sad path' do
        it "sends a 404 error as a response" do
            create_list(:merchant, 3)

            item_params = {
                        name: 'Amazon'
                    }
            headers = {"CONTENT_TYPE" => "application/json"}
        
            patch "/api/v1/items/10000000000000000000000000000", headers: headers, params: JSON.generate({item: item_params})
            
            expect(response.status).to eq(404)
        end
    end
end