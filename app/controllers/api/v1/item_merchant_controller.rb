class Api::V1::ItemMerchantController < ApplicationController

    def show 
         render json: MerchantSerializer.new(Merchant.find(params[:id]))
    end
end