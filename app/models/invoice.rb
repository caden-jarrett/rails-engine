class Invoice < ApplicationRecord
    belongs_to :customer
    has_many :transactions
    has_many :invoice_items
    has_many :item, through: :invoice_items

    validates_presence_of :customer_id, :merchant_id, :status
end