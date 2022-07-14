require 'rails_helper'

RSpec.describe Merchant, type: :model do
  describe 'relationships' do
    it { should have_many(:items)}
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
  end

  it 'can search for merchants' do
    merchant1 = create(:merchant, name: "Aaron Inc")
    merchant2 = create(:merchant, name: "Todd Inc")
    merchant3 = create(:merchant, name: "Peter Inc")
    merchant4 = create(:merchant, name: "Patrick Inc")
    # binding.pry
    expect(Merchant.search_merchants("Pat")).to eq(merchant4)
    expect(Merchant.search_merchants("aa")).to eq(merchant1)
    expect(Merchant.search_merchants("a")).to eq(merchant1)
    expect(Merchant.search_merchants("P")).to eq(merchant4)

    expect(Merchant.search_merchants("To")).to eq(merchant2)

    expect(Merchant.search_merchants("pe")).to eq(merchant3)
  end
end
