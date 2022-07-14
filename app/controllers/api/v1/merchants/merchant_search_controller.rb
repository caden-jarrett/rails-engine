class Api::V1::Merchants::MerchantSearchController < ApplicationController

    def find 
        merchant = Merchant.search_merchants(params[:name])
    end
end