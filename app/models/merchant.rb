class Merchant < ApplicationRecord
    has_many :items

    validates_presence_of :name

    def self.search_merchants(name)
        where('name ILIKE ?', "%#{name}%")
        .order(:name)
        .first
    end
end
