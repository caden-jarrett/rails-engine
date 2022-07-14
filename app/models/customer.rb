class Customer < ApplicationRecord 
    has_many :invoice 
    has_many :transactions, through: :invoice
end