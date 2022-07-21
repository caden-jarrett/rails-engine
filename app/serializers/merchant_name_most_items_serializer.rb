class MerchantNameMostItemsSerializer
    include JSONAPI::Serializer
    attributes :name 

    attributes :count do |merchant|
        merchant.count 
    end
end