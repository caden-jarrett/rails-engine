class MerchantSerializer
  include JSONAPI::Serializer
  attributes :name

  def self.no_match
    {data: {}, errors: 'expected null to be an object'}
  end
end
