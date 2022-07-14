class Customer < ApplicationRecord 
    has_many :invoice 
    has_many :transactions, through: :invoice

    validates_presence_of :first_name, :last_name
end