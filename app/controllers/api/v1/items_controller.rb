class Api::V1::ItemsController < ApplicationController

    def index 
        render json: ItemSerializer.new(Item.all)
    end

    def show 
        render json: ItemSerializer.new(Item.find(params[:id]))
    end

    def create 
      item = Item.create(item_params)
      if item.save 
        render json: ItemSerializer.new(item), status: :created
      end
    end

    def destroy 
        item= Item.find(params[:id])
        Item.destroy(params[:id])
        render json: item
    end

    # show off
    def update 
        item = Item.update(params[:id], item_params)
        render json: ItemSerializer.new(item)
    end


    private 
  
        def item_params
            params.require(:item).permit(:name,:description,:unit_price,:merchant_id)
        end
end