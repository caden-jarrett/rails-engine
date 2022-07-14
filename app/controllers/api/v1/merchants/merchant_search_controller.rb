class Api::V1::Merchants::MerchantSearchController < ApplicationController

    def find 
        merchant = Merchant.search_merchants(params[:name])
        if merchant != nil
            render json: MerchantSerializer.new(merchant)
        else
            render json: MerchantSerializer.no_match
        end
    end
end