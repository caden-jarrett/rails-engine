require 'rails_helper'

RSpec.describe Merchant, type: :model do
  describe 'relationships' do
    it { should have_many(:items)}
  end

   describe 'validations' do
    it_validates_prescence_of :name
  end
end
