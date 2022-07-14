
class Api::V1::MerchantsController < ApplicationController
  def index
    binding.pry
    render json: MerchantSerializer.new(Merchant.all)
  end

  def show 
    binding.pry
    render json: MerchantSerializer.new(Merchant.find(params[:id]))
  end
end
