require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'relationships' do
    it { should belong_to(:merchant)}
    it { should have_many(:invoice_items)}
    it { should have_many(:items).through(:invoice_items)}
  end

  describe 'validations' do
    it_validates_prescence_of :name
    it_validates_prescence_of :description
    it_validates_prescence_of :unit_price
    it_validates_prescence_of :merchant_id
  end
end